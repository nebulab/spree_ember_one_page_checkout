`import Ember from 'ember'`

SpreeService = Ember.Service.extend

  currentOrder: ( ->
    @store.find('order', @get('currentOrderId'))
  ).property('currentOrderId')

  currentOrderId: ( ->
    Spree.current_order_id
  ).property()

  currentOrderToken: ( ->
    Spree.current_order_token
  ).property()

`export default SpreeService`
