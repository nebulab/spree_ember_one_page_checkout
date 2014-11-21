# For more information see: http://emberjs.com/guides/routing/

SpreeCheckout.CartRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo('checkout.cart')
