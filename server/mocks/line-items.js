module.exports = function(app) {
  var express = require('express');
  var lineItemsRouter = express.Router();

  lineItemsRouter.get('/', function(req, res) {
    res.send({
      'line-items': []
    });
  });

  lineItemsRouter.post('/', function(req, res) {
    res.status(201).end();
  });

  lineItemsRouter.get('/:id', function(req, res) {
    res.send({
      'line-items': {
        id: req.params.id
      }
    });
  });

  lineItemsRouter.put('/:id', function(req, res) {
    res.send({
      "id":250,"quantity":4,"price":"19.99","variant_id":26,"single_display_amount":"$19.99","display_amount":"$79.96","total":"79.96","variant":{"id":26,"name":"Ruby on Rails Baseball Jersey","sku":"ROR-00010","price":"19.99","weight":"0.0","height":null,"width":null,"depth":null,"is_master":false,"slug":"ruby-on-rails-baseball-jersey","description":"Sed omnis dolorum sit ullam autem asperiores ipsa voluptates. Voluptatem placeat repudiandae velit aut iure ipsum. Sequi est consequatur praesentium expedita. Libero impedit odit explicabo assumenda voluptas.","track_inventory":true,"cost_price":"17.0","display_price":"$19.99","options_text":"Size: XL, Color: Green","in_stock":true,"is_backorderable":true,"total_on_hand":10,"is_destroyed":false,"option_values":[{"id":4,"name":"Extra Large","presentation":"XL","option_type_name":"tshirt-size","option_type_id":1,"option_type_presentation":"Size"},{"id":6,"name":"Green","presentation":"Green","option_type_name":"tshirt-color","option_type_id":2,"option_type_presentation":"Color"}],"images":[{"id":19,"position":1,"attachment_content_type":"image/png","attachment_file_name":"ror_baseball_jersey_green.png","type":"Spree::Image","attachment_updated_at":"2015-02-13T16:08:59.650Z","attachment_width":240,"attachment_height":240,"alt":null,"viewable_type":"Spree::Variant","viewable_id":26,"mini_url":"/spree/products/19/mini/ror_baseball_jersey_green.png?1423843739","small_url":"/spree/products/19/small/ror_baseball_jersey_green.png?1423843739","product_url":"/spree/products/19/product/ror_baseball_jersey_green.png?1423843739","large_url":"/spree/products/19/large/ror_baseball_jersey_green.png?1423843739"},{"id":20,"position":2,"attachment_content_type":"image/png","attachment_file_name":"ror_baseball_jersey_back_green.png","type":"Spree::Image","attachment_updated_at":"2015-02-13T16:09:00.251Z","attachment_width":240,"attachment_height":240,"alt":null,"viewable_type":"Spree::Variant","viewable_id":26,"mini_url":"/spree/products/20/mini/ror_baseball_jersey_back_green.png?1423843740","small_url":"/spree/products/20/small/ror_baseball_jersey_back_green.png?1423843740","product_url":"/spree/products/20/product/ror_baseball_jersey_back_green.png?1423843740","large_url":"/spree/products/20/large/ror_baseball_jersey_back_green.png?1423843740"}],"product_id":3},"adjustments":[]
    });

    app.set('order_state', 'line_item_updated');
  });

  lineItemsRouter.delete('/:id', function(req, res) {
    res.status(204).end();
  });

  app.use('/api/orders/:order_id/line_items', lineItemsRouter);
};
