`import Ember from 'ember'`

CheckoutRoute = Ember.Route.extend
  model: ->
    @store.find('order', Spree.current_order_id)

  afterModel: (order, transition) ->
    if Ember.isPresent(order.get('state'))
      @transitionTo("checkout.#{order.get('state')}")

`export default CheckoutRoute`
