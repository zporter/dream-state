// We need to bring in the ExtractTextPlugin. This will allow us to pull the
// CSS out of our bundle and output it to its own file.
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  // We'll change our entry point to look for an scss file instead
  entry: ["./web/static/css/app.scss", "./web/static/js/app.js"],
  output: {
    path: "./priv/static",
    filename: "js/app.js"
  },
  module: {
    loaders: [{
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel",
        query: {
          presets: ["es2015"]
        }
      },
      // We'll configure an scss loader
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract(
          "style",
          "css!sass?includePaths[]=" + __dirname + "/node_modules"
        )
      }
    ]
  },
  // And we'll add the plugin configuration
  plugins: [
    new ExtractTextPlugin("css/app.css")
  ],
  resolve: {
    modulesDirectories: [
      "node_modules",
      __dirname + "/web/static/js"
    ]
  }
}
