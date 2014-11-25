# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Shipment = DS.Model.extend
  selected_shipping_rate_id: DS.attr('number')

  order: DS.belongsTo('order')
  shipping_rates: DS.hasMany('shipping-rate')

  selectedShippingRate: ( ->
    @get('shipping_rates').findBy('id', selected_shipping_rate_id)
  ).property('selected_shipping_rate_id')
