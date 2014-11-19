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
  use_billing: DS.attr('boolean')
  user_id: DS.attr('number')

  ship_address: DS.belongsTo('ship-address')
  bill_address: DS.belongsTo('bill-address')
  line_items: DS.hasMany('line-item')
  shipments: DS.hasMany('shipments')

  applyCouponCode: ->
    console.log(@)
    console.log(@constructor)
    console.log(@.constructor)
    console.log(@adapter)
    @ajax(
      url: "/api/orders/#{Spree.current_order_id}/apply_coupon_code?coupon_code=#{@get('coupon_code')}",
      method: 'PUT',
    ).then =>
      @set('coupon_code', null)
      @reload()

`export default Order`
