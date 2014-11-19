`import DS from 'ember-data'`
`import Application from './application'`

OrderAdapter = Application.extend

  # updateRecord: (store, type, record) ->
  #   data = {}
  #   serializer = store.serializerFor(type.typeKey)
  #   serializer.serializeIntoHash(data, type, record)
  #   id = Ember.get(record, 'id')
  #   @ajax("/api/checkouts/#{id}", "PUT", { data: data });

  apply_coupon_code: (store, type, record) ->
    console.log('apply_coupon')

`export default OrderAdapter`
