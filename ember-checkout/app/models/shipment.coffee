`import DS from 'ember-data'`

Shipment = DS.Model.extend
  order: DS.belongsTo('order')
  shipping_methods: DS.hasMany('shipping-method')
  display_discounted_cost: DS.attr('string')

`export default Shipment`
