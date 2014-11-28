Ember.Handlebars.helper 'money', (value, options) ->
  if Ember.isEmpty(value)
    return new Ember.Handlebars.SafeString("#{Spree.current_order_currency_symbol} 0")
  formatted = parseFloat(value, 10).toFixed(2)
  return new Ember.Handlebars.SafeString("#{Spree.current_order_currency_symbol} #{formatted}")
