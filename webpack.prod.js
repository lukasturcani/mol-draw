const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const path = require('path');


module.exports = {
    entry: {
        molDraw: './output/MolDraw/index.js',
    },
    output: {
        path: path.join(__dirname, 'dist'),
        filename: '[name].js',
        library: '[name]',
    },
    externals: {
        three: {
            commonjs: 'three',
            commonjs2: 'three',
            amd: 'three',
            root: 'THREE',
        },
        'three-trackballcontrols': {
            commonjs: 'three-trackballcontrols',
            commonjs2: 'three-trackballcontrols',
            amd: 'three-trackballcontrols',
            root: 'TrackballControls',
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
