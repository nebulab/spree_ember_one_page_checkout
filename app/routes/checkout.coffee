`import Ember from 'ember'`

CheckoutRoute = Ember.Route.extend
  model: ->
    @store.find('order', @get('spree.currentOrderId'))

`export default CheckoutRoute`
