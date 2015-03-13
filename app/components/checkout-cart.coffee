`import Ember from 'ember'`

CheckoutCartComponent = Ember.Component.extend

  actions:
    applyCouponCode: ->
      @get('order').save().then (order) ->
        order.set('couponCode', null)

`export default CheckoutCartComponent`
