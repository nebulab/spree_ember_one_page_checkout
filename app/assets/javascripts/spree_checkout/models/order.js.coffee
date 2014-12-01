# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Order = DS.Model.extend
  coupon_code: null
  use_billing: true
  payment_method_id: null
  payment_source: null

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
  checkout_steps: DS.attr()
  user_id: DS.attr('number')
  email: DS.attr('string')

  ship_address: DS.belongsTo('ship-address')
  bill_address: DS.belongsTo('bill-address')
  line_items: DS.hasMany('line-item')
  shipments: DS.hasMany('shipment')
  payments: DS.hasMany('payment')
  payment_methods: DS.hasMany('payment-method')
  adjustments: DS.hasMany('adjustment')

  init: ->
    @set('payment_source', SpreeCheckout.PaymentSource.create())
    @_super()

  lineItemsAdjustments: ( ->
    result = []
    adjustments = null
    @get('line_items').forEach (line_item) ->
      adjustments = line_item.get('eligibleAdjustments')
      adjustments.forEach (adjustment) ->
        label = adjustment.get('label')
        found = result.findBy('label', label)
        if(!found)
          LineItemAdjustment = Ember.Object.extend
            amount: ( ->
              @get('adjustments').reduce(( (previousValue, adjustment) ->
                previousValue + adjustment.get('amount')
              ), 0)
            ).property('adjustments')
          lineItemsAdjustment = LineItemAdjustment.create
            label: label,
            adjustments: [],
          result.pushObject(lineItemsAdjustment)
        result.findBy('label', label).get('adjustments').pushObject(adjustment)
    result
  ).property('line_items.@each.eligibleAdjustments')

  eligibleAdjustments: ( ->
    @get('adjustments').filterBy('eligible')
  ).property('adjustments')

  hasAddress: ( ->
    @hasStep('address')
  ).property('checkout_steps')

  hasDelivery: ( ->
    @hasStep('delivery')
  ).property('checkout_steps')

  hasPayment: ( ->
    @hasStep('payment')
  ).property('checkout_steps')

  hasConfirm: ( ->
    @hasStep('confirm')
  ).property('checkout_steps')

  hasStep: (step) ->
    @get('checkout_steps').contains(step)

