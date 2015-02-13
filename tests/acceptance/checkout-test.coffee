`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import startApp from '../helpers/start-app'`

application = null

module 'Acceptance: Checkout',
  beforeEach: ->
    application = startApp()
    ###
    Don't return as Ember.Application.then is deprecated.
    Newer version of QUnit uses the return value's .then
    function to wait for promises if it exists.
    ###
    return

  afterEach: ->
    Ember.run application, 'destroy'

test 'visiting /checkout', (assert) ->
  visit '/checkout'

  andThen ->
    assert.equal currentURL(), '/checkout'

test 'it shows cart total', (assert) ->
  assert.expect(1)

  visit('/checkout').then ->
    assert.equal(find('.cart-total h5:last').text(), '$59.97')
