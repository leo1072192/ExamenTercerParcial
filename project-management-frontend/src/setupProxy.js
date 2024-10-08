const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function(app) {
  app.use(
    '/api',
    createProxyMiddleware({
      target: process.env.REACT_APP_API_URL,
      changeOrigin: true,
    })
  );

  app.use(
    '/graphql',
    createProxyMiddleware({
      target: process.env.REACT_APP_GRAPHQL_URL,
      changeOrigin: true,
    })
  );
};
