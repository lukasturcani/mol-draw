const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const path = require('path');


module.exports = {
    entry: {
        'mol-draw': './output/MolDraw/index.js',
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: 'mol-draw.js',
        library: 'mol-draw',
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
