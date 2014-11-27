SpreeCheckout.AddressSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    country: { serialize: false, deserialize: 'records' }
    state: { serialize: false, deserialize: 'records' }
  }
)
