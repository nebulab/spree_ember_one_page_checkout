SpreeCheckout.ShipmentSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    shipping_rates: { embedded: 'always' }
  }
)
