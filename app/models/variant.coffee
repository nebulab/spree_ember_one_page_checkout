`import DS from 'ember-data'`

Variant = DS.Model.extend

  name: DS.attr('string')
  optionsText: DS.attr('string')
  description: DS.attr('string')
  optionValues: DS.attr()

  lineItem: DS.belongsTo('line-item')

`export default Variant`
