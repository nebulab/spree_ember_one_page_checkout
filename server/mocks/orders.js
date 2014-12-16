module.exports = function(app) {
  var express = require('express');
  var ordersRouter = express.Router();

  ordersRouter.get('/', function(req, res) {
    res.send({
      "orders": []
    });
  });

  ordersRouter.post('/', function(req, res) {
    res.status(201).end();
  });

  ordersRouter.get('/:id', function(req, res) {
    res.send({
      "orders": {
        // "id": req.params.id
        "id":80,
        "number":"R548899559",
        "item_total":"51.97",
        "total":"51.97",
        "ship_total":"0.0",
        "state":"cart",
        "adjustment_total":"0.0",
        "user_id":null,
        "created_at":"2014-12-16T09:33:09.945Z",
        "updated_at":"2014-12-16T09:42:44.808Z",
        "completed_at":null,
        "payment_total":"0.0",
        "shipment_state":null,
        "payment_state":null,
        "email":null,
        "special_instructions":null,
        "channel":"spree",
        "included_tax_total":"0.0",
        "additional_tax_total":"0.0",
        "display_included_tax_total":"$0.00",
        "display_additional_tax_total":"$0.00",
        "tax_total":"0.0","currency":"USD",
        "display_item_total":"$51.97",
        "total_quantity":3,
        "display_total":"$51.97",
        "display_ship_total":"$0.00",
        "display_tax_total":"$0.00",
        "token":"_JUoEVIBaOjbrTF42Q3Q3g",
        "checkout_steps": ["address","delivery","payment","complete"],
        "permissions": {"can_update":false},
        "bill_address":null,
        "ship_address":null,
        "line_items": [
          { "id":119,
            "quantity":2,
            "price":"15.99",
            "variant_id":1,
            "single_display_amount":"$15.99",
            "display_amount":"$31.98",
            "total":"31.98",
            "variant": {
              "id":1,
              "name":"Ruby on Rails Tote",
              "sku":"ROR-00011",
              "price":"15.99",
              "weight":"0.0",
              "height":null,
              "width":null,
              "depth":null,
              "is_master":true,
              "cost_price":"17.0",
              "slug":"ruby-on-rails-tote",
              "description":"Dolor id et praesentium fugiat error earum recusandae. Eum quia magni est dolorem quod.",
              "track_inventory":true,
              "display_price":"$15.99",
              "options_text":"",
              "in_stock":false,
              "option_values":[],
              "images":[
                { "id":21,
                  "position":1,
                  "attachment_content_type":"image/jpeg",
                  "attachment_file_name":"ror_tote.jpeg",
                  "type":"Spree::Image",
                  "attachment_updated_at":"2014-10-17T09:00:57.366Z",
                  "attachment_width":360,
                  "attachment_height":360,
                  "alt":null,
                  "viewable_type":"Spree::Variant",
                  "viewable_id":1,
                  "mini_url":"/spree/products/21/mini/ror_tote.jpeg?1413536457",
                  "small_url":"/spree/products/21/small/ror_tote.jpeg?1413536457",
                  "product_url":"/spree/products/21/product/ror_tote.jpeg?1413536457",
                  "large_url":"/spree/products/21/large/ror_tote.jpeg?1413536457"
              }, {
                "id":22,
                "position":2,
                "attachment_content_type":"image/jpeg",
                "attachment_file_name":"ror_tote_back.jpeg",
                "type":"Spree::Image",
                "attachment_updated_at":"2014-10-17T09:00:57.755Z",
                "attachment_width":360,"attachment_height":360,
                "alt":null,
                "viewable_type":"Spree::Variant",
                "viewable_id":1,
                "mini_url":"/spree/products/22/mini/ror_tote_back.jpeg?1413536457",
                "small_url":"/spree/products/22/small/ror_tote_back.jpeg?1413536457",
                "product_url":"/spree/products/22/product/ror_tote_back.jpeg?1413536457",
                "large_url":"/spree/products/22/large/ror_tote_back.jpeg?1413536457"
              }
              ],
              "product_id":1
            },
            "adjustments":[]
        },{
          "id":120,
          "quantity":1,
          "price":"19.99",
          "variant_id":7,
          "single_display_amount":"$19.99",
          "display_amount":"$19.99",
          "total":"19.99",
          "variant":{
            "id":7,
            "name":"Apache Baseball Jersey",
            "sku":"APC-00001",
            "price":"19.99",
            "weight":"0.0",
            "height":null,
            "width":null,
            "depth":null,
            "is_master":true,
            "cost_price":"17.0",
            "slug":"apache-baseball-jersey",
            "description":"Dolor id et praesentium fugiat error earum recusandae. Eum quia magni est dolorem quod",
            "track_inventory":true,
            "display_price":"$19.99",
            "options_text":"",
            "in_stock":true,
            "option_values":[],
            "images":[
              { "id":33,
                "position":1,
                "attachment_content_type":"image/png",
                "attachment_file_name":"apache_baseball.png",
                "type":"Spree::Image",
                "attachment_updated_at":"2014-10-17T09:01:02.473Z",
                "attachment_width":504,
                "attachment_height":484,
                "alt":null,
                "viewable_type":"Spree::Variant",
                "viewable_id":7,
                "mini_url":"/spree/products/33/mini/apache_baseball.png?1413536462",
                "small_url":"/spree/products/33/small/apache_baseball.png?1413536462",
                "product_url":"/spree/products/33/product/apache_baseball.png?1413536462",
                "large_url":"/spree/products/33/large/apache_baseball.png?1413536462"
              }
            ],
            "product_id":7
          },"adjustments":[]
        }],
        "payments":[],
        "shipments":[],
        "adjustments":[]
      }
    }
  );
});

ordersRouter.put('/:id', function(req, res) {
  res.send({
    "orders": {
      "id": req.params.id
    }
  });
});

ordersRouter.delete('/:id', function(req, res) {
  res.status(204).end();
});

app.use('/api/orders', ordersRouter);
};
