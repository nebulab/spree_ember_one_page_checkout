`import DS from 'ember-data'`

ShipmentSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    shipping_methods: { embedded: 'always' }
  }
)

`export default ShipmentSerializer`
