`import Ember from 'ember'`
`import deactivateRouting from 'ember-islands/deactivate-routing'`
`import renderComponents from 'ember-islands/render-components'`
`import config from '../config/environment'`

get = Ember.get

SpreeInitializer =
  name: 'spree-service'
  after: 'store'

  initialize: (container, app) ->
    injects = ->
      app.inject 'service:spree', 'store', 'store:main'
      app.inject 'component', 'spree', 'service:spree'
      app.inject 'adapter', 'spree', 'service:spree'
      deactivateRouting(app)
      renderComponents(app)

    unless config.environment == 'production'
      token = get(app, 'SPREE_TOKEN')
      window.Spree = {}
      line_items = { line_item: { variant_id: 1, quantity: 2 } }
      jQuery.ajax("/api/orders?token=#{token}", method: "POST").then (order) =>
        window.Spree.current_order_id = order.number
        window.Spree.current_order_token = order.token
        jQuery.ajax("/api/orders/#{order.number}/line_items?token=#{token}", method: "POST", data: line_items ).then (line_item) =>
          injects()
    else
      injects()



`export default SpreeInitializer`
