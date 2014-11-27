SpreeCheckout.CheckoutStepComponent = Ember.Component.extend
  tagName: 'div'
  classNameBindings: ['isEnabled:enabled:disabled']

  disableInputs: ( ->
    inputs = @.$().find("input, select")
    if @get('isEnabled')
      inputs.removeAttr("disabled")
    else
      inputs.attr("disabled", "disabled")
  ).observes('isEnabled')

  isEnabled: ( ->
    @get('order.state') == @get('step')
  ).property('order.state')

  actions:
    goToState: (step) ->
      @sendAction('goToState', step)
