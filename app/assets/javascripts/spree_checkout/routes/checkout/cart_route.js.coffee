SpreeCheckout.CheckoutCartRoute = Ember.Route.extend
  renderTemplate: ->
    @render({ outlet: 'cart' })
