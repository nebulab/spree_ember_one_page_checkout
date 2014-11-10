`import DS from 'ember-data'`

Order = DS.Model.extend
  number: DS.attr('string')

  line_items: DS.hasMany('line-item')

`export default Order`
