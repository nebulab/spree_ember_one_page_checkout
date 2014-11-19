`import DS from 'ember-data'`

ShippingRate = DS.Model.extend
  name: DS.attr('string')
  display_cost: DS.attr('string')
  selected: DS.attr('boolean')

  shipment: DS.belongsTo('shipment')

`export default ShippingRate`
