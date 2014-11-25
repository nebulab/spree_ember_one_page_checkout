# for more details see: http://emberjs.com/guides/models/defining-models/

SpreeCheckout.Adjustment = DS.Model.extend
  amount: DS.attr('number')
  display_amount: DS.attr('string')
  eligible: DS.attr('boolean')
  label: DS.attr('string')
  adjustable_type: DS.attr('string')
