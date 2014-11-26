SpreeCheckout.OrderAdapter = SpreeCheckout.ApplicationAdapter.extend
  applyCouponCode: (order) ->
    @ajax("/api/orders/#{order.get('number')}/apply_coupon_code", 'PUT', { data: { coupon_code: order.get('coupon_code') }})

  next: (order) ->
    @ajax("/api/checkouts/#{order.get('number')}/next", 'PUT').then ( (success) =>
      type = order.store.modelFor(order.constructor.typeKey)
      serializer = order.store.serializerFor(type.typeKey)
      record = serializer.extract(order.store, type, success, @get('id'), 'single')
      order.store.push(order.constructor.typeKey, record)
    ), (errors) =>
      order.adapterDidInvalidate(errors)

  updateAddresses: (order) ->
    data = { order: { bill_address_attributes: @serialize(order.get('bill_address'), { includeId: true }) }}
    if order.get('use_billing')
      data['order']['use_billing'] = true
    else
      data['order']['ship_address_attributes'] = @serialize(order.get('ship_address'), { includeId: true })
    @checkoutRequest(order, data)

  updatePayment: (order) ->
    data = { order: { payments_attributes: [{ payment_method_id: order.get('payment_method_id') }] }}
    if order.get('store').getById('payment_method', order.get('payment_method_id')).get('isGateway')
      data['payment_source'] = {}
      data['payment_source'][order.get('payment_method_id')] =  {
        number: order.get('payment_source.number')
        expiry: order.get('payment_source.expiry')
        verification_value: order.get('payment_source.verification_value')
        name: order.get('payment_source.name')
        cc_type: 'visa'
      }
    @checkoutRequest(order, data)

  selectShippingRate: (order) ->
    data = { order: { shipments_attributes: {} }}
    order.get('shipments').forEach (shipment, index) =>
      data['order']['shipments_attributes'][index] = {
        id: shipment.id,
        selected_shipping_rate_id: shipment.get('shipping_rates').findBy('selected', true).get('id')
      }
    @checkoutRequest(order, data)

  goToState: (order, state) ->
    @checkoutRequest(order, { state: state })

  confirm: (order) ->
    @checkoutRequest(order)

  checkoutRequest: (order, data) ->
    @ajax("/api/checkouts/#{order.get('number')}", 'PUT', { data: data }).then ( (success) =>
      type = order.store.modelFor(order.constructor.typeKey)
      serializer = order.store.serializerFor(type.typeKey)
      record = serializer.extract(order.store, type, success, @get('id'), 'single')
      order.store.push(order.constructor.typeKey, record)
    ), (errors) =>
      order.adapterDidInvalidate(errors)
