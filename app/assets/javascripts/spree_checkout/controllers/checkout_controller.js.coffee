# for more details see: http://emberjs.com/guides/controllers/

SpreeCheckout.CheckoutController = Ember.ObjectController.extend

  checkQuantity: ->
    if @get('model.total_quantity') <= 0
      window.location.replace('/cart')

  reloadCart: ->
    @get('model').reload().then =>
      @checkQuantity()

  actions:
    apply_coupon_code: ->
      @get('model').applyCouponCode()

    update_line_item: (line_item) ->
      line_item.save().then =>
        @reloadCart()

    destroy_line_item: (line_item) ->
      line_item.destroyRecord().then =>
        @reloadCart()

    updateAddresses: ->
      @get('model').updateAddresses()

    selectShippingRate: ->
      @get('model').selectShippingRate()

    next: ->
      @get('model').next =>
        @transitionToRoute("checkout.#{@get('state')}")