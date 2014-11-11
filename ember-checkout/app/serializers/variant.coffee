`import DS from 'ember-data'`

VariantSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    images: { embedded: 'always' }
  }
)

`export default VariantSerializer`
