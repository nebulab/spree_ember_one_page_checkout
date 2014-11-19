`import DS from 'ember-data'`
`import Application from './application'`

LineItemAdapter = Application.extend
  namespace: "api/orders/#{Spree.current_order_id}"

`export default LineItemAdapter`
