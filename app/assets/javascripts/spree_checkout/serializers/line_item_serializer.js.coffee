SpreeCheckout.LineItemSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs: {
    variant: { embedded: 'always' }
    adjustments: { embedded: 'always' }
  }
)
