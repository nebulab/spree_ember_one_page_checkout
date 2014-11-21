# for more details see: http://emberjs.com/guides/views/

SpreeCheckout.LineItemListView = Ember.CollectionView.extend
  tagName: 'tbody'

  itemViewClass: Ember.View.extend
    classNames: ['line-item']
    templateName: 'checkout/line_item'

    contextBinding: 'content'

    quantities: [1..10]

    quantitySelect: Ember.Select.extend
      change: (event) ->
        @get('controller').send('update_line_item', @get('parentView.content'))

    removeView: Ember.View.extend
      click: (event) ->
        @get('controller').send('destroy_line_item', @get('parentView.content'))
