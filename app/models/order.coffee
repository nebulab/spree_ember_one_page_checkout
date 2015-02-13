`import DS from 'ember-data'`

Order = DS.Model.extend

  number: DS.attr('string')
  itemTotal: DS.attr('number')
  displayItemTotal: DS.attr('string')
  total: DS.attr('number')
  totalQuantity: DS.attr('number')
  displayTotal: DS.attr('string')
  displayTaxTotal: DS.attr('string')
  shipTotal: DS.attr('number')
  adjustmentTotal: DS.attr('number')
  state: DS.attr('string')
  checkoutSteps: DS.attr()
  userId: DS.attr('number')
  email: DS.attr('string')

  lineItems: DS.hasMany('line-item')

`export default Order`
