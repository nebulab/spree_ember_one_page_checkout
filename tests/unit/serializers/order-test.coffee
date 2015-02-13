`import { test, moduleFor } from 'ember-qunit'`
`import startApp from '../../helpers/start-app'`

application = null

moduleFor 'serializer:order', 'OrderSerializer', {
  setup: ->
    application = startApp()
    ###
    Don't return as Ember.Application.then is deprecated.
    Newer version of QUnit uses the return value's .then
    function to wait for promises if it exists.
    ###
    return

  teardown: ->
    Ember.run application, 'destroy'
}

# QUnit.skip 'it sets payload number as order id', ->
#   serializer = @subject()
#
#   application.__container__.register('transform:string', DS.StringTransform)
#   store = application.__container__.lookup('store:main')
#
#   jsonHash = { id: 940, number: "R362248067" }
#   serializer.extractSingle(store, store.modelFor('order'), jsonHash, 'R362248067')
#
#   equal(serializer.extractSingle(store, store.modelFor('order'), jsonHash, 'R362248067').id, 'R362248067')
