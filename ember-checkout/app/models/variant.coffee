`import DS from 'ember-data'`

Variant = DS.Model.extend
  name: DS.attr('string')

  line_item: DS.belongsTo('line_item')

`export default Variant`
