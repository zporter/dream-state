// We need to bring in the ExtractTextPlugin. This will allow us to pull the
// CSS out of our bundle and output it to its own file.
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  // We'll add an entry point for CSS, which means our `entry` field must now
  // be an array
  entry: ["./web/static/css/app.css", "./web/static/js/app.js"],
  // since we're no longer just outputting js, we'll tweak our output path and
  // output filename for js.
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
      // We'll add a css loader
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract("style", "css")
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
