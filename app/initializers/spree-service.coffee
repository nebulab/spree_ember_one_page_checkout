SpreeInitializer =
  name: 'spree-service'
  initialize: (container, app) ->
    app.inject('service:spree', 'store', 'store:main')
    app.inject 'component', 'spree', 'service:spree'

`export default SpreeInitializer`
