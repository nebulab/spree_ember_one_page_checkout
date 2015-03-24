`import DS from 'ember-data'`

AddressSerializer = DS.ActiveModelSerializer.extend

  serializeIntoHash: (data, type, snapshot, options) ->
    data['order'] = @serialize(snapshot, options)

  serialize: (snapshot, options) ->
    json = {}
    json[@get('rootKey')] = @_super(snapshot, options)
    json

`export default AddressSerializer`
