`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'adapter:application', 'ApplicationAdapter', {
  # Specify the other units that are required for this test.
}

test 'it has correct namespace', ->
  adapter = @subject()
  equal(adapter.get('namespace'), 'api')

test 'it appends order token to the url', ->
  adapter = @subject()
  adapter.set('spree', { 'currentOrderToken': '123'} )
  equal(adapter.buildURL(), '/api?order_token=123')
