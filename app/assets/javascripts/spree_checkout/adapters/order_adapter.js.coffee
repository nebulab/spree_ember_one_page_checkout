SpreeCheckout.OrderAdapter = SpreeCheckout.ApplicationAdapter.extend

  updateRecord: (store, type, record) ->
    data = {};
    serializer = store.serializerFor(type.typeKey)
    serializer.serializeIntoHash(data, type, record)
    id = record.get('id')
    data.state = record.get('state')
    @ajax(@buildURL('checkouts', id, record), "PUT", { data: data })
