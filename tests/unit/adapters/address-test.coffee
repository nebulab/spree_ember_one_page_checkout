`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'adapter:address', 'AddressAdapter', {
  # Specify the other units that are required for this test.
}

test 'addressAdapter.createRecord() makes requests to the checkout endpoint', ->
  adapter = @subject()
  store = DS.Store.create( adapter: adapter )
  adapter.set('spree', { 'currentOrderId': '123'} )
  adapter.createRecord(@store, store.modelFor('address'), { zipcode: 123 }).then ->
    equal($.ajax.mostRecentCall.args[0]["url"], 'cippalippa')
