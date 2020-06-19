const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');


module.exports = {
    entry: './output/MolDraw.DrawMol/index.js',
    output: {
        path: path.join(__dirname, 'dist'),
        filename: 'molDraw.js',
    },
    plugins: [
        new HtmlWebpackPlugin({
            title: 'molDraw',
            template: './src/template.html',
        }),
    ],
    mode: 'development',
    resolve: {
        extensions: ['.js', '.json'],
    },
}
