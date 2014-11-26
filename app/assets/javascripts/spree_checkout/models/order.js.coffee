# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Order = DS.Model.extend
  coupon_code: null
  use_billing: true
  payment_method_id: null

  number: DS.attr('string')
  item_total: DS.attr('number')
  display_item_total: DS.attr('string')
  total: DS.attr('number')
  total_quantity: DS.attr('number')
  display_total: DS.attr('string')
  display_tax_total: DS.attr('string')
  ship_total: DS.attr('number')
  adjustment_total: DS.attr('number')
  state: DS.attr('string')
  user_id: DS.attr('number')

  ship_address: DS.belongsTo('ship-address')
  payment_source: DS.belongsTo('payment-source')
  bill_address: DS.belongsTo('bill-address')
  line_items: DS.hasMany('line-item')
  shipments: DS.hasMany('shipment')
  payments: DS.hasMany('payment')
  payment_methods: DS.hasMany('payment-method')
  adjustments: DS.hasMany('adjustment')

  lineItemsAdjustments: ( ->
    result = []
    adjustments = null
    @get('line_items').forEach (line_item) ->
      adjustments = line_item.get('adjustments').filterBy('eligible')
    adjustments.forEach (adjustment) ->
      label = adjustment.get('label')
      found = result.findBy('label', label)
      if(!found)
        result.pushObject(Ember.Object.create({label: label, adjustments: []}))
      result.findBy('label', label).get('adjustments').pushObject(adjustment);
    result
  ).property('line_items.@each.adjustments.@each.eligible')

  selectedShipments: ( ->
    result = []
    @get('shipments').forEach (shipment) ->
      result.pushObject(shipment.get('shipping_rates').findBy('selected'))
    result
  ).property('shipments.@each.selected_shipping_rate_id')

  applyCouponCode: ->
    @store.adapterFor(@constructor.typeKey).applyCouponCode(@).then ( =>
      @set('coupon_code', null)
      @reload()
    ), ( (errors) =>
      @set('coupon_code', null)
      @transitionTo('loaded.updated.uncommitted')
      @get('errors').add('coupon_code', error.message)
    )

  updateAddresses: ->
    @store.adapterFor(@constructor).updateAddresses(@)

  updatePayment: ->
    @store.adapterFor(@constructor).updatePayment(@)

  next: ->
    @store.adapterFor(@constructor).next(@)

  confirm: ->
    @store.adapterFor(@constructor).confirm(@)

  selectShippingRate: ->
    @store.adapterFor(@constructor).selectShippingRate(@)

  goToState: (state) ->
    @store.adapterFor(@constructor).goToState(@, state)
