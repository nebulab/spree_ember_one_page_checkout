`import Ember from 'ember'`

AddressFormController = Ember.ObjectController.extend
  countries: ( ->
    @store.find('country', { per_page: 1000 })
  ).property()

  states: ( ->
    if Ember.isPresent(@get('country_id'))
      @store.find('state', { country_id: @get('country_id'), per_page: 1000 })
  ).property('country_id')

`export default AddressFormController`
