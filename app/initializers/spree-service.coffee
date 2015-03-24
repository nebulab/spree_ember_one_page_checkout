`import deactivateRouting from 'ember-islands/deactivate-routing'`
`import renderComponents from 'ember-islands/render-components'`

SpreeInitializer =
  name: 'spree-service'
  after: 'store'

  initialize: (container, app) ->
    app.inject 'service:spree', 'store', 'store:main'
    app.inject 'component', 'spree', 'service:spree'
    app.inject 'adapter', 'spree', 'service:spree'
    deactivateRouting(app)
    renderComponents(app)

`export default SpreeInitializer`
