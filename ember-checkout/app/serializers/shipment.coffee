`import DS from 'ember-data'`

ShipmentSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    shipping_rates: { embedded: 'always' }
  }
)

`export default ShipmentSerializer`
