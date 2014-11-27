SpreeCheckout.CheckoutConfirmRoute = Ember.Route.extend
  renderTemplate: ->
    @render({ outlet: 'confirm' })
