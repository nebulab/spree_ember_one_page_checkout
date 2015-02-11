`import EmberSpree from '../models/ember-spree'`
`import config from '../config/environment'`

initialize = (container, app) ->
  app.deferReadiness()

  emberSpree = EmberSpree.create()

  app.register('spree:main', emberSpree, { singleton: true, instantiate: false })
  app.inject('route', 'spree', 'spree:main')
  app.inject('adapter', 'spree', 'spree:main')

  if config.environment == "production"
    emberSpree.set('currentOrderId', Spree.current_order_id)
    app.advanceReadiness()
  else
    Ember.$.ajax(
      url: '/api/orders?token=f1d12fc2051b5f596d7460a35561a1f1a8a5bb2fb26f695d'
      type: 'POST'
    ).then (order) =>
      emberSpree.set('currentOrderId', order.number)
      emberSpree.set('currentOrderToken', order.token)
      Ember.$.ajax(
        url: "/api/orders/#{emberSpree.get('currentOrderId')}/line_items.json?token=f1d12fc2051b5f596d7460a35561a1f1a8a5bb2fb26f695d"
        type: 'POST'
        data: { 'line_item': { 'variant_id': 26, 'quantity': 3 }}
      ).then =>
        app.advanceReadiness()

SpreeInitializer =
  name: 'spree'
  initialize: initialize

`export {initialize}`
`export default SpreeInitializer`
