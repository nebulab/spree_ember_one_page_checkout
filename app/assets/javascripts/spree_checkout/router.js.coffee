# For more information see: http://emberjs.com/guides/routing/

SpreeCheckout.Router.reopen
  rootURL: '/'
  location: 'auto'

SpreeCheckout.Router.map ->
  @route 'cart'
  @route 'checkout', ->
    @route 'cart'
    @route 'address'
    @route 'delivery'
    @route 'payment'
    @route 'confirm'

