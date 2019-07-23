import axios from 'axios'
// Full config:  https://github.com/axios/axios#request-config
// axios.defaults.baseURL = 'http://localhost:8000'

module.exports = {
    publicPath: '/',
    outputDir: '../',
    assetsDir: 'static',
    indexPath: 'templates/index.html',
    devServer: {
        proxy: 'http://localhost:8000'
    }
    // pages: {
    //     index :{
    //         entry: 'src/main.js',
    //         template: 'public/index.html',
    //         filename: 'index.html'
    //     }
    // }
}