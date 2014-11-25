SpreeCheckout.PaymentMethod = DS.Model.extend
  method_type: DS.attr('string')
  name: DS.attr('string')

  order: DS.belongsTo('order')

  isGateway: ( ->
    @get('method_type') == 'gateway'
  ).property('method_type')

  isCheck: ( ->
    @get('method_type') == 'check'
  ).property('method_type')

  isSelected: ( ->
    @get('order.payment_method_id') == @get('id')
  ).property('order.payment_method_id')
