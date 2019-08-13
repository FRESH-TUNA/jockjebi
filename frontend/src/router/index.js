import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);

const routes = [
    {
        path: '/',
        name: 'home',
        component: () => import('../components/Home')
    },
    {
        path: '/jockbolist',
        name: 'jockbolist',
        component: () => import('../components/jockboList'),
        props: true
    },
    {
        path: '/createjockbo',
        name: 'createJockbo',
        component: () => import('../components/createJockbo')
    },
    {
        path: '/updatejockbo/:id',
        name: 'updateJockbo',
        component: () => import('../components/createJockbo')
    },
    {
        path: '/detail/:id',
        name: 'detail',
        component: () => import('../components/newDetail'),
        props: true
    },
];

export default new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})
