`import Ember from 'ember'`

CartRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo('checkout.cart')

`export default CartRoute`
