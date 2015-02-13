`import DS from 'ember-data'`

OrderSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    lineItems: { embedded: 'always' }
  }

  extractSingle: (store, primaryType, rawPayload, recordId) ->
    typeKey = primaryType.typeKey
    payload = {}
    payload[typeKey] = rawPayload
    payload[typeKey]['id'] = payload[typeKey]['number']
    @_super store, primaryType, payload, recordId
)

`export default OrderSerializer`
