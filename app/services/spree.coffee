`import Ember from 'ember'`

SpreeService = Ember.Object.extend

  currentOrder: ( ->
    @store.find('order', @get('currentOrderId'))
  ).property('currentOrderId')

  currentOrderId: ->
    Spree.current_order_id

  currentOrderToken: ->
    Spree.current_order_token

`export default SpreeService`
