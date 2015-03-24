`import DS from 'ember-data'`
`import AddressSerializer from './address'`

ShipAddressSerializer = AddressSerializer.extend

  rootKey: 'ship_address_attributes'

`export default ShipAddressSerializer`
