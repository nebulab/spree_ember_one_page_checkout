`import Ember from 'ember'`
`import SpreeAddress from './spree-address'`

ShipAddressComponent = SpreeAddress.extend

  address: ( ->
    @get('spree.currentOrder.shipAddress')
  ).property('spree.currentOrder.shipAddress')

`export default ShipAddressComponent`
