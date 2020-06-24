const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const path = require('path');


module.exports = {
    entry: {
        molDraw: './output/MolDraw/index.js',
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: 'molDraw.js',
        library: 'molDraw',
        libraryTarget: 'umd',
    },
    externals: {
        three: {
            commonjs: 'three',
            commonjs2: 'three',
            amd: 'three',
            root: 'THREE',
        },
    },
    mode: 'production',
    resolve: {
        extensions: ['.js', '.json'],
    },
    plugins: [
        new CleanWebpackPlugin(),
    ],
}
