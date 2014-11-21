SpreeCheckout.CountryAdapter = SpreeCheckout.ApplicationAdapter.extend

  headers:
    'X-Spree-Token': $.cookie('guest_token')
