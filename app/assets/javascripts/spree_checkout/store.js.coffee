# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

SpreeCheckout.ApplicationStore = DS.Store.extend({
  adapter: Ember.ActiveModelAdapter
})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
SpreeCheckout.ApplicationAdapter = DS.ActiveModelAdapter.extend

  defaultSerializer: Ember.ActiveModelSerializer
  namespace: 'api'
  headers:
    'X-Spree-Order-Token': Spree.current_order_token
    'X-Spree-Token': $.cookie('guest_token')
