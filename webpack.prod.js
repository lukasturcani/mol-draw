const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const path = require('path');


module.exports = {
    entry: {
        molDraw: './output/MolDraw/index.js',
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: '[name].js',
    },
    mode: 'production',
    resolve: {
        extensions: ['.js', '.json'],
    },
    plugins: [
        new CleanWebpackPlugin(),
    ],
}
