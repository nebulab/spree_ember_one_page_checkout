`import Ember from 'ember'`

Checkout = Ember.Object.extend

  ajax: (url = '', data = {}) ->
    new Ember.RSVP.Promise ( (resolve, reject) =>
      Ember.$.ajax({
        url: "/api/checkouts/#{Spree.current_order_id}/#{url}",
        method: 'PUT',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify(data)
        headers:
          'X-Spree-Order-Token': Spree.current_order_token,
          'Accept':              'application/json'
      }).then (order) ->
        resolve(order)
    ), (error) ->
      reject(error)

  update_addresses: (shipAddress, billAddress) ->
    data = { order: { bill_address_attributes: billAddress, ship_address_attributes: shipAddress } }
    @ajax('', data)

  select_shipping_rate: (shipments) ->
    data = { order: { shipments_attributes: {} }}
    shipments.forEach (shipment, index) =>
      data['order']['shipments_attributes'][index] = {
        id: shipment.id,
        selected_shipping_rate_id: shipment.get('shipping_rates').findBy('selected', true).get('id')
      }
    @ajax('', data)

  next: ->
    @ajax 'next'

`export default Checkout`
