`import EmberSpree from '../models/ember-spree'`
`import config from '../config/environment'`

initialize = (container, app) ->
  app.deferReadiness()

  emberSpree = EmberSpree.create()
  
  app.register('spree:main', emberSpree, { singleton: true, instantiate: false })
  app.inject('route', 'spree', 'spree:main')
  app.inject('adapter', 'spree', 'spree:main')

  app.advanceReadiness()

SpreeInitializer =
  name: 'spree'
  initialize: initialize

`export {initialize}`
`export default SpreeInitializer`
