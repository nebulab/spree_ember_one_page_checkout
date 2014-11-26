# for more details see: http://emberjs.com/guides/controllers/

SpreeCheckout.CheckoutController = Ember.ObjectController.extend

  isCart: ( ->
    @get('model.state') == 'cart'
  ).property('model.state')

  isAddress: ( ->
    @get('model.state') == 'address'
  ).property('model.state')

  isDelivery: ( ->
    @get('model.state') == 'delivery'
  ).property('model.state')

  isPayment: ( ->
    @get('model.state') == 'payment'
  ).property('model.state')

  isConfirm: ( ->
    @get('model.state') == 'confirm'
  ).property('model.state')

  transitionTo: (state) ->
    if state == 'complete'
      window.location.replace("/orders/#{@get('model.number')}")
    else
      @transitionToRoute("checkout.#{state}")

  checkQuantity: ->
    if @get('model.total_quantity') <= 0
      window.location.replace('/cart')

  reloadCart: ->
    @get('model').reload().then =>
      @checkQuantity()

  actions:
    goToState: (state) ->
      @get('model').goToState(state).then =>
        @transitionTo(@get('model.state'))

    apply_coupon_code: ->
      @get('model').applyCouponCode()

    update_line_item: (line_item) ->
      line_item.save().then =>
        @reloadCart()

    destroy_line_item: (line_item) ->
      line_item.destroyRecord().then =>
        @reloadCart()

    updateAddresses: ->
      @get('model').updateAddresses().then =>
        @transitionTo(@get('model.state'))

    updatePayment: ->
      @get('model').updatePayment().then =>
        @transitionTo(@get('model.state'))

    selectShippingRate: ->
      @get('model').selectShippingRate().then =>
        @transitionTo(@get('model.state'))

    confirm: ->
      @get('model').confirm().then =>
        @transitionTo(@get('model.state'))

    next: ->
      @get('model').next().then =>
        @transitionTo(@get('model.state'))
