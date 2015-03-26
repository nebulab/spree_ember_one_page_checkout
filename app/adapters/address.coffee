`import ApplicationAdapter from './application'`

AddressAdapter = ApplicationAdapter.extend

  createRecord: (store, type, snapshot) ->
    data = {};
    serializer = store.serializerFor(type.typeKey);

    serializer.serializeIntoHash(data, type, snapshot, { includeId: true });

    @ajax(@buildURL('checkouts', @get('spree.currentOrderId'), snapshot), "PUT", { data: data });

`export default AddressAdapter`
