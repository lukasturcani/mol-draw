const path = require('path');


module.exports = {
    entry: './output/MolDraw.DrawMol/index.js',
    output: {
        path: path.join(__dirname, 'dist'),
        filename: 'molDraw.js',
    },
    mode: 'development',
    resolve: {
        extensions: ['.js', '.json'],
    },
}
