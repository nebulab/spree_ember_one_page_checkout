# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Order = DS.Model.extend
  coupon_code: null
  use_billing: false
  payment_method_id: null

  number: DS.attr('string')
  item_total: DS.attr('number')
  display_item_total: DS.attr('string')
  total: DS.attr('number')
  total_quantity: DS.attr('number')
  display_total: DS.attr('string')
  ship_total: DS.attr('number')
  adjustment_total: DS.attr('number')
  state: DS.attr('string')
  user_id: DS.attr('number')

  ship_address: DS.belongsTo('ship-address')
  payment_source: DS.belongsTo('payment-source')
  bill_address: DS.belongsTo('bill-address')
  line_items: DS.hasMany('line-item')
  shipments: DS.hasMany('shipments')
  payment_methods: DS.hasMany('payment-method')


  applyCouponCode: ->
    @set('coupon_code', null)
    @store.adapterFor(@constructor.typeKey).applyCouponCode(@).then ( =>
      @reload()
    ), ( (errors) =>
      @transitionTo('loaded.updated.uncommitted')
      @get('errors').add('coupon_code', error.message)
    )

  updateAddresses: ->
    @store.adapterFor(@constructor.typeKey).updateAddresses(@).then ( (success) =>
      @reload()
    ), (errors) =>
      console.log(errors)
      @adapterDidInvalidate(errors)

  updatePayment: ->
    @store.adapterFor(@constructor.typeKey).updatePayment(@).then ( (success) =>
      @reload()
    ), (errors) =>
      console.log(errors)
      @adapterDidInvalidate(errors)

  next: ->
    @store.adapterFor(@constructor.typeKey).next(@).then ( (success) =>
      @reload()
    ), (errors) =>
      console.log(errors)
      @adapterDidInvalidate(errors)

  selectShippingRate: ->
    @store.adapterFor(@constructor.typeKey).selectShippingRate(@).then ( (success) =>
      @reload()
    ), (errors) =>
      console.log(errors)
      @adapterDidInvalidate(errors)
