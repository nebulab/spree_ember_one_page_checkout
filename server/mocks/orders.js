module.exports = function(app) {
  var express = require('express');
  var ordersRouter = express.Router();

  var basic_order = function() { return { "id":123, "number":"R597057435", "item_total": 91.95, "total": 91.95, "ship_total":"0.0", "state":"cart", "adjustment_total":"0.0", "user_id":1, "created_at":"2015-02-16T21:30:25.487Z", "updated_at":"2015-02-16T21:30:27.166Z", "completed_at":null, "payment_total":"0.0", "shipment_state":null, "payment_state":null, "email":"spree@example.com", "special_instructions":null, "channel":"spree", "included_tax_total":"0.0", "additional_tax_total":"0.0", "display_included_tax_total":"$0.00", "display_additional_tax_total":"$0.00", "tax_total":"0.0", "currency":"USD", "display_item_total": "$91.95", "total_quantity":5, "display_total": "$91.95", "display_ship_total":"$0.00", "display_tax_total":"$0.00", "token":"W6liKzEWTfZ1dezfmAMTtw", "checkout_steps":[ "address", "delivery", "payment", "complete" ], "permissions":{ "can_update":false }, "bill_address":null, "ship_address":null, "line_items":[ { "id":240, "quantity": 4, "price":"19.99", "variant_id":26, "single_display_amount":"$19.99", "display_amount": "$59.97", "total": "$78.96", "variant":{ "id":26, "name":"Ruby on Rails Baseball Jersey", "sku":"ROR-00010", "price":"19.99", "weight":"0.0", "height":null, "width":null, "depth":null, "is_master":false, "slug":"ruby-on-rails-baseball-jersey", "description":"Sed omnis dolorum sit ullam autem asperiores ipsa voluptates. Voluptatem placeat repudiandae velit aut iure ipsum. Sequi est consequatur praesentium expedita. Libero impedit odit explicabo assumenda voluptas.", "track_inventory":true, "display_price":"$19.99", "options_text":"Size: XL, Color: Green", "in_stock":true, "is_backorderable":true, "total_on_hand":10, "is_destroyed":false, "option_values":[ { "id":4, "name":"Extra Large", "presentation":"XL", "option_type_name":"tshirt-size", "option_type_id":1, "option_type_presentation":"Size" }, { "id":6, "name":"Green", "presentation":"Green", "option_type_name":"tshirt-color", "option_type_id":2, "option_type_presentation":"Color" } ], "images":[ { "id":19, "position":1, "attachment_content_type":"image/png", "attachment_file_name":"ror_baseball_jersey_green.png", "type":"Spree::Image", "attachment_updated_at":"2015-02-13T16:08:59.650Z", "attachment_width":240, "attachment_height":240, "alt":null, "viewable_type":"Spree::Variant", "viewable_id":26, "mini_url":"/spree/products/19/mini/ror_baseball_jersey_green.png?1423843739", "small_url":"/spree/products/19/small/ror_baseball_jersey_green.png?1423843739", "product_url":"/spree/products/19/product/ror_baseball_jersey_green.png?1423843739", "large_url":"/spree/products/19/large/ror_baseball_jersey_green.png?1423843739" }, { "id":20, "position":2, "attachment_content_type":"image/png", "attachment_file_name":"ror_baseball_jersey_back_green.png", "type":"Spree::Image", "attachment_updated_at":"2015-02-13T16:09:00.251Z", "attachment_width":240, "attachment_height":240, "alt":null, "viewable_type":"Spree::Variant", "viewable_id":26, "mini_url":"/spree/products/20/mini/ror_baseball_jersey_back_green.png?1423843740", "small_url":"/spree/products/20/small/ror_baseball_jersey_back_green.png?1423843740", "product_url":"/spree/products/20/product/ror_baseball_jersey_back_green.png?1423843740", "large_url":"/spree/products/20/large/ror_baseball_jersey_back_green.png?1423843740" } ], "product_id":3 }, "adjustments":[ ] }, { "id":241, "quantity":2, "price":"15.99", "variant_id":1, "single_display_amount":"$15.99", "display_amount":"$31.98", "total":"31.98", "variant":{ "id":1, "name":"Ruby on Rails Tote", "sku":"ROR-00011", "price":"15.99", "weight":"0.0", "height":null, "width":null, "depth":null, "is_master":true, "slug":"ruby-on-rails-tote", "description":"Sed omnis dolorum sit ullam autem asperiores ipsa voluptates. Voluptatem placeat repudiandae velit aut iure ipsum. Sequi est consequatur praesentium expedita. Libero impedit odit explicabo assumenda voluptas.", "track_inventory":true, "display_price":"$15.99", "options_text":"", "in_stock":true, "is_backorderable":true, "total_on_hand":10, "is_destroyed":false, "option_values":[ ], "images":[ { "id":21, "position":1, "attachment_content_type":"image/jpeg", "attachment_file_name":"ror_tote.jpeg", "type":"Spree::Image", "attachment_updated_at":"2015-02-13T16:09:00.756Z", "attachment_width":360, "attachment_height":360, "alt":null, "viewable_type":"Spree::Variant", "viewable_id":1, "mini_url":"/spree/products/21/mini/ror_tote.jpeg?1423843740", "small_url":"/spree/products/21/small/ror_tote.jpeg?1423843740", "product_url":"/spree/products/21/product/ror_tote.jpeg?1423843740", "large_url":"/spree/products/21/large/ror_tote.jpeg?1423843740" }, { "id":22, "position":2, "attachment_content_type":"image/jpeg", "attachment_file_name":"ror_tote_back.jpeg", "type":"Spree::Image", "attachment_updated_at":"2015-02-13T16:09:01.397Z", "attachment_width":360, "attachment_height":360, "alt":null, "viewable_type":"Spree::Variant", "viewable_id":1, "mini_url":"/spree/products/22/mini/ror_tote_back.jpeg?1423843741", "small_url":"/spree/products/22/small/ror_tote_back.jpeg?1423843741", "product_url":"/spree/products/22/product/ror_tote_back.jpeg?1423843741", "large_url":"/spree/products/22/large/ror_tote_back.jpeg?1423843741" } ], "product_id":1 }, "adjustments":[ ] } ], "payments":[ ], "shipments":[ ], "adjustments":[ ], "credit_cards":[ ] } }

  var itemTotal =  { null: '91.95', 'line_item_updated': '111.94', 'line_item_deleted': '31.98' };
  var total =  { null: '91.95', 'line_item_updated': '111.94', 'line_item_deleted': '31.98' };
  var displayItemTotal =  { null: '$91.95', 'line_item_updated': '$111.94', 'line_item_deleted': '$31.98' };
  var displayTotal =  { null: '$91.95', 'line_item_updated': '$111.94', 'line_item_deleted': '$31.98' };

  var lineItemQuantity =  { null: 3, 'line_item_updated': 4, 'line_item_deleted': 3 };
  var lineItemTotal =  { null: "$59.97", 'line_item_updated': "$78.96" };
  var lineItemDisplayAmount =  { null: "$59.97", 'line_item_updated': "$78.96" };

  ordersRouter.get('/:id', function(req, res) {
    order = basic_order();
    order['item_total'] = itemTotal[req.app.get('order_state')];
    order['total'] = total[req.app.get('order_state')];
    order['display_item_total'] = displayItemTotal[req.app.get('order_state')];
    order['display_total'] = displayTotal[req.app.get('order_state')];

    if(req.app.get('order_state') == 'line_item_deleted') {
      order['line_items'].splice(0,1);
    }else{
      order['line_items'][0]['quantity'] = lineItemQuantity[req.app.get('order_state')];
      order['line_items'][0]['total'] = lineItemTotal[req.app.get('order_state')];
      order['line_items'][0]['display_amount'] = lineItemDisplayAmount[req.app.get('order_state')];
    }

    res.send(order);
    app.set('order_state', null);
  });

  ordersRouter.put('/:id', function(req, res) {
    order = basic_order();
    order['display_total'] = '$25.58';
    order['total'] = '$25.58';
    res.send(order);
  });

  ordersRouter.delete('/:id', function(req, res) {
    res.status(204).end();
  });

  app.use('/api/orders', ordersRouter);
};
