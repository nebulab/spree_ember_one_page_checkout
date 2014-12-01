SpreeCheckout.CheckoutPaymentRoute = Ember.Route.extend

  renderTemplate: ->
    @render({ outlet: 'payment' })
