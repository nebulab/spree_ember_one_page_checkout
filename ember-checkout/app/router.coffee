`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'coupon', path: 'coupon/:coupon_code'
  @route 'cart'
  @route 'checkout', ->
    @route 'cart'
    @route 'address'
    @route 'delivery'
    @route 'payment'
    @route 'confirm'

`export default Router`
