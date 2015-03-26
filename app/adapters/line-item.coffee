`import ApplicationAdapter from './application'`

LineItemAdapter = ApplicationAdapter.extend

  pathForType: (type) ->
   "#{@_super('order')}/#{@get('spree.currentOrderId')}/#{@_super(type)}"

`export default LineItemAdapter`
