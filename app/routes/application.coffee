`import Ember from 'ember'`
`import config from '../config/environment'`

ApplicationRoute = Ember.Route.extend

  beforeModel: ->
    if config.environment == "production"
      @get('spree').set('currentOrderId', Spree.current_order_id)
    else
      Ember.$.ajax(
        url: '/api/orders?token=f1d12fc2051b5f596d7460a35561a1f1a8a5bb2fb26f695d'
        type: 'POST'
      ).then (order) =>
        @get('spree').set('currentOrderId', order.number)
        @get('spree').set('currentOrderToken', order.token)
        Ember.$.ajax(
          url: "/api/orders/#{@get('spree.currentOrderId')}/line_items.json?token=f1d12fc2051b5f596d7460a35561a1f1a8a5bb2fb26f695d"
          type: 'POST'
          data: { 'line_item': { 'variant_id': 26, 'quantity': 3 }}
        )


`export default ApplicationRoute`
