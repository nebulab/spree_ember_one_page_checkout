`import DS from 'ember-data'`

Address = DS.Model.extend
  firstname: DS.attr('string')
  lastname: DS.attr('string')
  address1: DS.attr('string')
  address2: DS.attr('string')
  city: DS.attr('string')
  phone: DS.attr('string')
  zipcode: DS.attr('string')

  country_id: DS.attr('number')
  state_id: DS.attr('number')

  order: DS.belongsTo('order')

`export default Address`
