`import DS from 'ember-data'`

VariantSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    images: { embedded: 'always' }
  }
)

`export default VariantSerializer`
