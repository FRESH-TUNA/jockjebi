module.exports = {
    publicPath: '/static/',
    outputDir: '../static',

    pages: {
        index :{
            entry: 'src/main.js',
            template: 'public/index.html',
            filename: 'index.html'
        }
    }
}