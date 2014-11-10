`import Ember from 'ember'`

CartView = Ember.View.extend

  quantitySelect: Ember.Select.extend
    change: (event) ->
      @get('parentView.controller').send('updateCheckout')

`export default CartView`
