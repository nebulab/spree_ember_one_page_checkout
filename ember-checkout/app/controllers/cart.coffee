`import Ember from 'ember'`

CartController = Ember.ObjectController.extend(
  quantities: [1..10]

  actions:
    updateCheckout: ->
      @get('model').save().catch(-> alert('errore'))
)

`export default CartController`
