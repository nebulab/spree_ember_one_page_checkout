SpreeCheckout.CreditCardCvcComponent = Ember.TextField.extend

  didInsertElement: ->
    @$().payment('formatCardCVC')
