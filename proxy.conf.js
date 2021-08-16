var PROXY_CONF = {
  "/api": {
    "target": process.env.API_URL || "http://localhost:8080",
    "secure": true,
    "pathRewrite": {
    "^/api": ""
  },
    "changeOrigin": true
  }
}

module.exports = PROXY_CONF