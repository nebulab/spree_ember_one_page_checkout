# For more information see: http://emberjs.com/guides/routing/

SpreeCheckout.CheckoutAddressRoute = Ember.Route.extend

  beforeModel: ->
    order = @modelFor('checkout')
    if Ember.isEmpty(order.get('ship_address'))
      order.set('ship_address', @store.createRecord('ship-address'))
    if Ember.isEmpty(order.get('bill_address'))
      order.set('bill_address', @store.createRecord('bill-address'))
