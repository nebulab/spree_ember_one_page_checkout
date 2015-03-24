`import DS from 'ember-data'`

ShipAddressSerializer = DS.ActiveModelSerializer.extend

  serializeIntoHash: (data, type, snapshot, options) ->
    data['order'] = @serialize(snapshot, options)

  serialize: (snapshot, options) ->
    { 'ship_address_attributes': @_super(snapshot, options) }

`export default ShipAddressSerializer`
