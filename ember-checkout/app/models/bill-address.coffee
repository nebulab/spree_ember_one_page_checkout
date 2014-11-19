`import DS from 'ember-data'`

BillAddress = DS.Model.extend
  firstname: DS.attr('string')
  lastname: DS.attr('string')
  address1: DS.attr('string')
  city: DS.attr('string')
  country_id: DS.attr('number')
  state_id: DS.attr('string')
  phone: DS.attr('string')
  zipcode: DS.attr('string')

  order: DS.belongsTo('order')

`export default BillAddress`
