`import DS from 'ember-data'`

Order = DS.Model.extend
  coupon_code: null

  number: DS.attr('string')
  item_total: DS.attr('number')
  display_item_total: DS.attr('string')
  total: DS.attr('number')
  total_quantity: DS.attr('number')
  display_total: DS.attr('string')
  ship_total: DS.attr('number')
  adjustment_total: DS.attr('number')
  state: DS.attr('string')

  ship_address: DS.belongsTo('ship-address')
  line_items: DS.hasMany('line-item')
  shipments: DS.hasMany('shipments')

`export default Order`
