# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Variant = DS.Model.extend

  name: DS.attr('string')
  options_text: DS.attr('string')
  description: DS.attr('string')

  default_image: ( ->
    @get('images.firstObject')
  ).property('images')

  line_item: DS.belongsTo('line_item')
  images: DS.hasMany('image')
