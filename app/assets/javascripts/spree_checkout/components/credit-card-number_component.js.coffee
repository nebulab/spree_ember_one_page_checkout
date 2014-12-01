SpreeCheckout.CreditCardNumberComponent = Ember.TextField.extend

  formatCardNumber: ( ->
    @$().payment('formatCardNumber')
  ).on('didInsertElement')
