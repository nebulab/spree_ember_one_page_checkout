`import Ember from 'ember'`
`import DS from 'ember-data'`
`import ShipAddress from 'spree-checkout/models/ship-address'`
`import BillAddress from 'spree-checkout/models/bill-address'`

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
  shipAddress: DS.belongsTo('ship-address')
  billAddress: DS.belongsTo('bill-address')

  init: ->
    @_super()
    @set('shipAddress', @store.createRecord('shipAddress'))
    @set('billAddress', @store.createRecord('billAddress'))

`export default Order`
