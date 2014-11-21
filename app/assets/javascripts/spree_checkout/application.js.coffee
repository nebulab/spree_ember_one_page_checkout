#= require jquery
#= require jquery.cookie
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ./spree_checkout

# for more details see: http://emberjs.com/guides/application/

window.SpreeCheckout = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true

  rootElement: '#checkout-app'

  Resolver: Ember.DefaultResolver.extend
    resolveTemplate: (parsedName) ->
      parsedName.fullNameWithoutType = "spree_checkout/#{parsedName.fullNameWithoutType}"
      @_super(parsedName)
