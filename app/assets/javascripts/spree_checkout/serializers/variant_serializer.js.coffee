SpreeCheckout.VariantSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    images: { embedded: 'always' }
  }
)
