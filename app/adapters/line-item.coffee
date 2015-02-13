`import ApplicationAdapter from './application'`

LineItemAdapter = ApplicationAdapter.extend

  namespace: ( ->
    "api/orders/#{@get('spree.currentOrderId')}"
  ).property()

`export default LineItemAdapter`
