`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'adapter:application', 'ApplicationAdapter', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

test 'it has correct namespace', ->
  adapter = @subject()
  equal(adapter.get('namespace'), 'api')
