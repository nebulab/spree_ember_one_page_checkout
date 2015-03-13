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
    assert.equal(find('.cart-total h5:last').text(), '$91.95')

test 'it shows line items', (assert) ->
  assert.expect(5)

  visit('/checkout').then ->
    assert.equal(find('.line-item').length, 2)

    assert.equal(find('td.cart-item-total:first').text().trim(), '$59.97')
    assert.equal(find('td.cart-item-total:last').text().trim(), '$31.98')

    assert.equal(find('.cart-item-description h4:first').text(), 'Ruby on Rails Baseball Jersey')
    assert.equal(find('.cart-item-description h4:last').text(), 'Ruby on Rails Tote')

test 'it changes cart total when a line item quantity is changed', (assert) ->
  assert.expect(3)

  visit('/checkout').then ->
    fillIn('.cart-item-quantity:first', 4).then ->
      click('.cart-item-quantity:first button').then ->
        assert.equal(find('.cart-total h5:last').text(), '$111.94')

        assert.equal(find('td.cart-item-total:first').text().trim(), '$78.96')
        assert.equal(find('td.cart-item-total:last').text().trim(), '$31.98')

test 'it changes cart total when a line item is remove', (assert) ->
  assert.expect(3)

  visit('/checkout').then ->
    click('.cart-item-delete:first span').then ->
      assert.equal(find('.line-item').length, 1)

      assert.equal(find('.cart-total h5:last').text(), '$31.98')

      assert.equal(find('td.cart-item-total:first').text().trim(), '$31.98')
