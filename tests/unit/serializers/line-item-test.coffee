`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'serializer:line-item', 'LineItemSerializer', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

# Replace this with your real tests.
test 'it exists', ->
  serializer = @subject()
  ok serializer
