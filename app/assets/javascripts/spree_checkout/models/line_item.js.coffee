# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.LineItem = DS.Model.extend

  quantity: DS.attr('number')
  price: DS.attr('number')
  single_display_amount: DS.attr('string')
  display_amount: DS.attr('string')
  total: DS.attr('number')

  order: DS.belongsTo('order')
  variant: DS.belongsTo('variant')
