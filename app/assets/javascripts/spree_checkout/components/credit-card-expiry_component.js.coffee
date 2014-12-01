SpreeCheckout.CreditCardExpiryComponent = Ember.TextField.extend

  didInsertElement: ->
    @$().payment('formatCardExpiry')
