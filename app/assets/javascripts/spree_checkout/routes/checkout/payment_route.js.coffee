SpreeCheckout.CheckoutPaymentRoute = Ember.Route.extend

  beforeModel: ->
    order = @modelFor('checkout')
    if Ember.isEmpty(order.get('payment_source'))
      order.set('payment_source', @store.createRecord('payment-source'))

  renderTemplate: ->
    @render({ outlet: 'payment' })
