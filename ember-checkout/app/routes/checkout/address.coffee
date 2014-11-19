`import Ember from 'ember'`

CheckoutAddressRoute = Ember.Route.extend

  beforeModel: ->
    order = @modelFor('checkout')
    order.reload()
    if Ember.isEmpty(order.get('ship_address'))
      order.set('ship_address', @store.createRecord('ship-address'))
    if Ember.isEmpty(order.get('bill_address'))
      order.set('bill_address', @store.createRecord('bill-address'))

`export default CheckoutAddressRoute`
