`import DS from 'ember-data'`

LineItemSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    variant: { embedded: 'always' }
    adjustments: { embedded: 'always' }
  }
)

`export default LineItemSerializer`
