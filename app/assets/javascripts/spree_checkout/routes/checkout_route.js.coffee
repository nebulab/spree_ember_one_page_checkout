# For more information see: http://emberjs.com/guides/routing/

SpreeCheckout.CheckoutRoute = Ember.Route.extend
  model: ->
    @store.find('order', Spree.current_order_id)

  afterModel: (order, transition) ->
    if Ember.isPresent(order.get('state'))
      @transitionTo("checkout.#{order.get('state')}")

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('countries', @store.find('country', { per_page: 1000 }))

  actions:
    continue: ->
      @modelFor('checkout').save().then (order) =>
        if @modelFor('checkout').get('state') == 'complete'
          window.location.replace("/orders/#{@modelFor('checkout').get('number')}")
        else
          @transitionTo("checkout.#{@modelFor('checkout').get('state')}")

    applyCoupon: ->
      Ember.$.ajax(
        "/api/orders/#{@modelFor('checkout').get('number')}/apply_coupon_code?coupon_code=#{@modelFor('checkout').get('coupon_code')}",
        type: "PUT",
        headers: { 'X-Spree-Order-Token': Spree.current_order_token, 'X-Spree-Token': $.cookie('guest_token') }
      ).then ( =>
        @modelFor('checkout').set('coupon_code', null)
        @modelFor('checkout').reload()
      ), ((errors) =>
        @modelFor('checkout').set('coupon_code', null)
        @modelFor('checkout').get('errors').add('coupon_code', errors.responseJSON.error)
      )

    goToState: (state) ->
      @modelFor('checkout').set('state', state)
      @transitionTo("checkout.#{@modelFor('checkout').get('state')}")
