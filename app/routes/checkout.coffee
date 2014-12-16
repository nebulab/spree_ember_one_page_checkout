`import Ember from 'ember'`

CheckoutRoute = Ember.Route.extend
  model: ->
    @store.find('order', @get('spree').current_order_id())

`export default CheckoutRoute`
