`import DS from 'ember-data'`

ApplicationAdapter = DS.ActiveModelAdapter.extend

  namespace: 'api'

  buildURL: (type, id, record) ->
    @_super(type, id, record) + "?order_token=#{@get('spree.currentOrderToken')}"

`export default ApplicationAdapter`
