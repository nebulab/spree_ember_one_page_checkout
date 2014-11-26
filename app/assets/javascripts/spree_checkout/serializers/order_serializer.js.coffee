SpreeCheckout.OrderSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  extractSingle: (store, primaryType, rawPayload, recordId) ->
    typeKey = primaryType.typeKey
    payload = {}
    payload[typeKey] = rawPayload
    payload[typeKey]['id'] = payload[typeKey]['number']
    @_super store, primaryType, payload, recordId

  attrs: {
    line_items: { embedded: 'always' }
    adjustments: { embedded: 'always' }
    ship_address: { embedded: 'always' }
    bill_address: { embedded: 'always' }
    shipments: { embedded: 'always' }
    payments: { embedded: 'always' }
    payment_methods: { embedded: 'always' }
  }
)
