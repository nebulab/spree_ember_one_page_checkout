`import DS from 'ember-data'`

ShippingMethod = DS.Model.extend
  name: DS.attr('string')

  shipment: DS.belongsTo('shipment')

`export default ShippingMethod`
