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
