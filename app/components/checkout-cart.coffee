`import Ember from 'ember'`

CheckoutCartComponent = Ember.Component.extend

  order: ( ->
    @get('spree.currentOrder')
  ).property('spree.currentOrder')

  actions:
    applyCouponCode: ->
      @get('order').save().then (order) ->
        order.set('couponCode', null)

`export default CheckoutCartComponent`
