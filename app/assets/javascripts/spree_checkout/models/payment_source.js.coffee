SpreeCheckout.PaymentSource = DS.Model.extend
  name: DS.attr('string')
  card_number: DS.attr('string')
  expiry: DS.attr('string')
  card_code: DS.attr('string')
