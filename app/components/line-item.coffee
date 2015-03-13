`import Ember from 'ember'`

LineItemComponent = Ember.Component.extend
  quantities: [1..10]

  actions:
    changeQuantity: ->
      @get('item').save().then (item) ->
        item.get('order').reload()

    remove: ->
      @get('item').destroyRecord().then (item) ->
        item.get('order').reload()

`export default LineItemComponent`
