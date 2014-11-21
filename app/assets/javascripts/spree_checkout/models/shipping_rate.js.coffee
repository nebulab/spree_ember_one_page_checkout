# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.ShippingRate = DS.Model.extend

  name: DS.attr('string')
  display_cost: DS.attr('string')
  selected: DS.attr('boolean')

  shipment: DS.belongsTo('shipment')
