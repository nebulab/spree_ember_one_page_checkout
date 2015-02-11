var proxyPath = '/api';

module.exports = function(app) {
  // For options, see:
  // https://github.com/nodejitsu/node-http-proxy
  var Proxy = require('http-proxy')

  Proxy.prototype.onError = function (err, req) {
    console.error(err, req.url);
  };

  var proxy = Proxy.createProxyServer({});
  var path = require('path');

  app.use(proxyPath, function(req, res, next){
    // include root path in proxied request
    req.url = path.join(proxyPath, req.url);
    proxy.web(req, res, { target: 'http://localhost:3001/' });
  });
};
