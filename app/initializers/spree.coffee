`import EmberSpree from '../models/ember-spree'`

initialize = (container, app) ->
  app.register('spree:main', EmberSpree)
  app.inject('route', 'spree', 'spree:main')

SpreeInitializer =
  name: 'spree'
  initialize: initialize

`export {initialize}`
`export default SpreeInitializer`
