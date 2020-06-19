const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const path = require('path');


module.exports = {
    entry: {
        molDraw: './output/MolDraw.DrawMol/index.js',
        example: './test/example/example.js'
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: '[name].js',
    },
    mode: 'development',
    resolve: {
        extensions: ['.js', '.json'],
    },
    plugins: [
        new CleanWebpackPlugin(),
        new HtmlWebpackPlugin({
            title: 'molDraw',
            template: './test/example/template.html',
        }),
    ],
}
