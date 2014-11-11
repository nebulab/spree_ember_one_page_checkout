`import DS from 'ember-data'`

LineItemSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    variant: { embedded: 'always' }
    adjustments: { embedded: 'always' }
  }
)

`export default LineItemSerializer`
