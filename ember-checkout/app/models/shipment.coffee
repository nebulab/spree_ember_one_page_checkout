`import DS from 'ember-data'`

Shipment = DS.Model.extend
  selected_shipping_rate_id: DS.attr('number')

  order: DS.belongsTo('order')
  shipping_rates: DS.hasMany('shipping-rate')

`export default Shipment`
