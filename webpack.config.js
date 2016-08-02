// We need to bring in the ExtractTextPlugin. This will allow us to pull the
// CSS out of our bundle and output it to its own file.
var ExtractTextPlugin = require("extract-text-webpack-plugin");

// we'll add a const for where our elm source files live
const elmSource = __dirname + "/web/elm"

module.exports = {
  entry: [
    "./web/static/css/app.scss",
    "./web/static/js/app.js",
    "./web/elm/Main.elm"
  ],

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
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract("style", "css")
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract(
          "style",
          "css!sass?includePaths[]=" + __dirname + "/node_modules"
        )
      },
      {
        test: /\.(woff|woff2)(\?v=\d+\.\d+\.\d+)?$/, loader: 'url?limit=10000&mimetype=application/font-woff'
      },
      {
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, loader: 'url?limit=10000&mimetype=application/octect-stream'
      },
      {
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, loader: 'file'
      },
      {
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, loader: 'url?limit=10000&mimetype=image/svg+xml'
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: "elm-webpack?cwd=" + elmSource
      }
    ],
    // and we don't want to parse Elm files since they won't be using require or define calls
    noParse: [/\.elm$/]
  },

  plugins: [
    new ExtractTextPlugin("css/app.css")
  ],

  resolve: {
    modulesDirectories: [
      "node_modules",
      __dirname + "/web/static/js"
    ],
    // we need webpack to know it can resolve elm files
    extensions: ['', '.scss', '.css', '.js', '.elm']
  }
}
