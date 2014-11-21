# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

SpreeCheckout.ApplicationStore = DS.Store.extend({
  adapter: Ember.ActiveModelAdapter
})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
SpreeCheckout.ApplicationAdapter = DS.ActiveModelAdapter.extend

  defaultSerializer: Ember.ActiveModelSerializer
  namespace: 'api'
  headers:
    'X-Spree-Order-Token': Spree.current_order_token

  applyCouponCode: (order) ->
    @ajax("/api/orders/#{order.get('number')}/apply_coupon_code", 'PUT', { data: { coupon_code: order.get('coupon_code') }})

  updateAddresses: (order) ->
    data = { order: { bill_address_attributes: @serialize(order.get('bill_address'), { includeId: true }) }}
    if order.get('use_billing')
      data['order']['use_billing'] = true
    else
      data['order']['ship_address_attributes'] = @serialize(order.get('ship_address'), { includeId: true })
    @ajax("/api/checkouts/#{order.get('number')}", 'PUT', { data: data })

  next: (order) ->
    @ajax("/api/checkouts/#{order.get('number')}/next", 'PUT')

  selectShippingRate: (order) ->
    data = { order: { shipments_attributes: {} }}
    order.get('shipments').forEach (shipment, index) =>
      data['order']['shipments_attributes'][index] = {
        id: shipment.id,
        selected_shipping_rate_id: shipment.get('shipping_rates').findBy('selected', true).get('id')
      }
    @ajax("/api/checkouts/#{order.get('number')}", 'PUT', { data: data })
