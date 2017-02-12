function mkwebpackconf
    string trim "
module.exports = {
  output: {
    filename: 'build.js'
  },
  module: {
    loaders: [
      {
        test: /.js/,
        exclude: /(node_modules)/,
        loader: 'babel',
        query:{
          presets: ['react', 'es2015']
        }
      }
    ]
  },
  resolve: {
    extensions: ['', '.js', '.jsx']
  }
};
" > ./webpack.config.js
    echo './webpack.config.js file was created.'
end
