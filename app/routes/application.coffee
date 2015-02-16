`import Ember from 'ember'`
`import config from '../config/environment'`

ApplicationRoute = Ember.Route.extend

  beforeModel: ->
    if config.environment == "production"
      @get('spree').set('currentOrderId', Spree.current_order_id)
      @get('spree').set('currentOrderToken', Spree.current_order_token)
    else
      @get('spree').set('currentOrderId', 'R597057435')
      @get('spree').set('currentOrderToken', 'ag9FHAF-SLN3Brl502SUlg')


`export default ApplicationRoute`
