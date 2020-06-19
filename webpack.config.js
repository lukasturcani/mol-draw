const path = require('path');


module.exports = {
    entry: {
        molDraw: './output/MolDraw.DrawMol/index.js',
        example: './src/example/example.js'
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: '[name].js',
    },
    mode: 'development',
    resolve: {
        extensions: ['.js', '.json'],
    },
}
