SpreeCheckout.AddressSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    country: { embedded: 'always' }
  }
)
