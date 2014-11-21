# for more details see: http://emberjs.com/guides/views/

SpreeCheckout.ShipmentRatesView = Ember.CollectionView.extend
  templateName: 'checkout/shipment_rates'
  tagName: 'ul'

  deselectAll: ->
    @get('content').forEach (shipment_rate) ->
      shipment_rate.set('selected', false)

  itemViewClass: Ember.View.extend
    classNames: ['shipping-method']
    templateName: 'checkout/shipment-rate'

    contextBinding: 'content'

    click: ->
      @get('parentView').deselectAll()
      @set('content.selected', true)
      @get('controller').send('selectShippingRate')
