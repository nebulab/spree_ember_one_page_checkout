`import Ember from 'ember'`

LineItemComponent = Ember.Component.extend

  quantities: [1..10]

  onQuantityDidChange: ( ->
    @get('item').save()
  ).observes('item.quantity')

  actions:
    remove: ->
      @get('item').destroyRecord()

`export default LineItemComponent`
