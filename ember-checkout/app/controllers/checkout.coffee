`import Ember from 'ember'`
`import Checkout from '../models/checkout'`

CheckoutController = Ember.ObjectController.extend

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
      checkout = Checkout.create()
      checkout.update_addresses(@get('model.ship_address'), @get('model.bill_address')).then =>
        @reloadCart()

    select_shipping_rate: ->
      checkout = Checkout.create()
      checkout.select_shipping_rate(@get('shipments')).then =>
        @reloadCart()

    next: ->
      checkout = Checkout.create()
      checkout.next().then =>
        @get('model').reload().then =>
          @transitionToRoute("checkout.#{@get('state')}")


`export default CheckoutController`
