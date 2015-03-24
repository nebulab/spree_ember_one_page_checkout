`import Ember from 'ember'`

SpreeAddressComponent = Ember.Component.extend

  address: null

  actions:
    save: ->
      @get('address').save()

`export default SpreeAddressComponent`
