# for more details see: http://emberjs.com/guides/controllers/

SpreeCheckout.CheckoutCartController = Ember.ObjectController.extend

  checkQuantity: ->
    if @get('model.total_quantity') <= 0
      window.location.replace('/cart')

  reloadCart: ->
    @get('model').reload().then =>
      @checkQuantity()

  actions:
    updateLineItem: (lineItem) ->
      lineItem.save().then =>
        @reloadCart()

    destroyLineItem: (lineItem) ->
      lineItem.destroyRecord().then =>
        @reloadCart()
