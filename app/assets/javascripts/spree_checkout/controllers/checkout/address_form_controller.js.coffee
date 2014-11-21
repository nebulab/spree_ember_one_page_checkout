# for more details see: http://emberjs.com/guides/controllers/

SpreeCheckout.CheckoutAddressFormController = Ember.ObjectController.extend

  needs: ['checkout']

  countries: Ember.computed.alias('controllers.checkout.countries')

  states: ( ->
    if Ember.isPresent(@get('country'))
      @store.find('state', { country_id: @get('country.id'), per_page: 1000 })
  ).property('country')
