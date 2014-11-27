SpreeCheckout.CheckoutDeliveryRoute = Ember.Route.extend
  renderTemplate: ->
    @render({ outlet: 'delivery' })
