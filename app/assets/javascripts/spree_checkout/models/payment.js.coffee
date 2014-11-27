SpreeCheckout.Payment = DS.Model.extend
  payment_method_id: DS.attr('number')

  order: DS.belongsTo('order')
