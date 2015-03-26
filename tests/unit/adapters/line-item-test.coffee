`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'adapter:line-item', 'LineItemAdapter', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

test 'lineItemAdapter.pathForType() returns order nested resource path', ->
  adapter = @subject()
  adapter.set('spree', { 'currentOrderId': '123'} )
  equal(adapter.pathForType('lineItem'), 'orders/123/line_items')
