`import Ember from 'ember'`
`import SpreeAddress from './spree-address'`

BillAddressComponent = SpreeAddress.extend

  address: ( ->
    @get('spree.currentOrder.billAddress')
  ).property('spree.currentOrder.billAddress')

`export default BillAddressComponent`
