SpreeCheckout.PaymentSource = DS.Model.extend
  name: DS.attr('string')
  card_number: DS.attr('string')
  month: DS.attr('string')
  year: DS.attr('string')
  card_code: DS.attr('string')
