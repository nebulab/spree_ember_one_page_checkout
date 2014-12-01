SpreeCheckout.PaymentSource = Ember.Object.extend
  name: null
  number: null
  expiry: null
  cardCode: null

  ccType: ( ->
    Ember.$.payment.cardType(@get('number'))
  ).property('number')
