`import DS from 'ember-data'`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api'
  headers:
    'X-Spree-Order-Token': Spree.current_order_token
    'Accept':              'application/json'

`export default ApplicationAdapter`
