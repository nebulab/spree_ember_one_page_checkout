#= require jquery
#= require jquery.cookie
#= require jquery.payment
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
      parsedName.fullNameWithoutType = @fullName(parsedName.fullNameWithoutType)
      @_super(parsedName)

    fullName: (fullNameWithoutType) ->
      if Ember.TEMPLATES.hasOwnProperty(@overridePath(fullNameWithoutType))
        @overridePath(fullNameWithoutType)
      else
        @defaultPath(fullNameWithoutType)

    overridePath: (fullNameWithoutType) ->
      "spree_checkout/overrides/#{fullNameWithoutType}"

    defaultPath: (fullNameWithoutType) ->
      "spree_checkout/#{fullNameWithoutType}"


