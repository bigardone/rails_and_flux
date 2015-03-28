var path = require("path");

module.exports = {
  context: __dirname,
  entry: {
    main:  "./webpack/main.coffee",
  },
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: "main.js",
    publicPath: "/js/"
  },
  resolve: {
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"]
  },
  module: {
    loaders: [
      { test: /\.js$/, loader: 'babel-loader'},
      { test: /\.jsx$/, loader: "jsx-loader?insertPragma=React.DOM" },
      { test: /\.cjsx$/, loaders: ["coffee", "cjsx"]},
      { test: /\.coffee$/,   loader: "coffee-loader"}
    ]
  }
}
