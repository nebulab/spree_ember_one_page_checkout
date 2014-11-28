# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Shipment = DS.Model.extend
  order: DS.belongsTo('order')
  shipping_rates: DS.hasMany('shipping-rate')

  selectedShippingRate: ( ->
    @get('shipping_rates').findBy('selected')
  ).property('shipping_rates.@each.selected')
