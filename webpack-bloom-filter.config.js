
module.exports = {
  entry: '../bloom-filter-js/src/main.js',
  output: {
    filename: 'bloom-filter-packed.js',
    path: __dirname + '/src',
    library: "BloomFilterModule"
  },
  node: {
    fs: 'empty'
  }
};

