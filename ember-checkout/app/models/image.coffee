`import DS from 'ember-data'`

Image = DS.Model.extend
  mini_url: DS.attr('string')
  small_url: DS.attr('string')

`export default Image`
