SpreeCheckout.CheckoutStepComponent = Ember.Component.extend
  tagName: 'div'
  classNameBindings: ['isEnabled:enabled:disabled']
  isEnabled: false

  disableInputs: ->
    inputs = @.$().find("input, select")
    if @get('isEnabled')
      inputs.removeAttr("disabled")
    else
      inputs.attr("disabled", "disabled")

  isEnabledDidChange: ( ->
    @disableInputs()
  ).observes('isEnabled')

  didInsertElement: ->
    @disableInputs()
