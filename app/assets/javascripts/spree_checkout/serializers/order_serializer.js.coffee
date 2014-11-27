SpreeCheckout.OrderSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    line_items: { embedded: 'always' }
    adjustments: { embedded: 'always' }
    ship_address: { embedded: 'always' }
    bill_address: { embedded: 'always' }
    shipments: { embedded: 'always' }
    payments: { embedded: 'always' }
    payment_methods: { embedded: 'always' }
  }

  extractSingle: (store, primaryType, rawPayload, recordId) ->
    typeKey = primaryType.typeKey
    payload = {}
    payload[typeKey] = rawPayload
    payload[typeKey]['id'] = payload[typeKey]['number']
    @_super store, primaryType, payload, recordId

  serialize: (order, options) ->
    if order.get('goToState')
      json = {}
    else
      switch order.get('state')
        when 'address' then @serializeAddresses(order)
        when 'delivery' then @serializeShippingRate(order)
        when 'payment' then @serializePayment(order)
        else @_super(order, options)

  serializeAddresses: (order) ->
    json = { bill_address_attributes: @serialize(order.get('bill_address'), { includeId: true }) }
    if order.get('use_billing')
      json['use_billing'] = true
    else
      json['ship_address_attributes'] = @serialize(order.get('ship_address'), { includeId: true })
    json

  serializeShippingRate: (order) ->
    json = { shipments_attributes: {} }
    order.get('shipments').forEach (shipment, index) =>
      json['shipments_attributes'][index] = {
        id: shipment.id,
        selected_shipping_rate_id: shipment.get('shipping_rates').findBy('selected', true).get('id')
      }
    json

  serializePayment: (order) ->
    json = { payments_attributes: [{ payment_method_id: order.get('payment_method_id') }] }
    if order.get('store').getById('payment_method', order.get('payment_method_id')).get('isGateway')
      json['payment_source'] = {}
      json['payment_source'][order.get('payment_method_id')] = {
        number: order.get('payment_source.number')
        expiry: order.get('payment_source.expiry')
        verification_value: order.get('payment_source.verification_value')
        name: order.get('payment_source.name')
        cc_type: 'visa'
      }
    json
)
