`import Ember from 'ember'`

CartRoute = Ember.Route.extend(
  model: ->
    @store.find('order', Spree.current_order_id)
)

`export default CartRoute`
