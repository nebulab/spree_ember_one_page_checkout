`import Ember from 'ember'`

ShipAddressComponent = Ember.Component.extend

  address: ( ->
    @get('spree.currentOrder.shipAddress')
  ).property('spree.currentOrder.shipAddress')

  actions:
    save: ->
      @get('address').save()

`export default ShipAddressComponent`
