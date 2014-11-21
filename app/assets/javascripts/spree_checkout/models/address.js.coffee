# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Address = DS.Model.extend

  firstname: DS.attr('string')
  lastname: DS.attr('string')
  address1: DS.attr('string')
  address2: DS.attr('string')
  city: DS.attr('string')
  phone: DS.attr('string')
  zipcode: DS.attr('string')

  country_id: DS.attr('number')

  order: DS.belongsTo('order')
  country: DS.belongsTo('country')

  countryDidChange: ( ->
    @set('country_id', @get('country.id'))
  ).observes('country')
