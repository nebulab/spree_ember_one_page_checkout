`import DS from 'ember-data'`

OrderSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin,
  extractSingle: (store, primaryType, rawPayload, recordId) ->
    typeKey = primaryType.typeKey
    payload = {}
    payload[typeKey] = rawPayload
    payload[typeKey]['id'] = payload[typeKey]['number']
    @_super store, primaryType, payload, recordId

  attrs: {
    line_items: { embedded: 'always' }
  }
)

`export default OrderSerializer`
