`import DS from 'ember-data'`
`import AddressSerializer from './address'`

BillAddressSerializer = AddressSerializer.extend

  rootKey: 'bill_address_attributes'

`export default BillAddressSerializer`
