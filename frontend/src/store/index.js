import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        jockboList: [],
        searchSubject: '',

        access: localStorage.getItem('access'),
        refresh: localStorage.getItem('refresh'),
        nickname: localStorage.getItem('nickname'),
        useruni: localStorage.getItem('useruni'),

        endpoints: {
            obtainJWT: '/api/token',
            refreshJWT: '/api/token/refresh'
        },
    },
    mutations: {
        updateTokenAndUserData(state, data){
            localStorage.setItem('access', 'Bearer ' + data.access);
            localStorage.setItem('refresh', 'Bearer ' + data.refresh);
            localStorage.setItem('nickname', data.nickname);
            localStorage.setItem('useruni', data.university);

            state.access= 'Bearer ' + data.access
            state.refresh= 'Bearer ' + data.refresh
            state.nickname= data.nickname
            state.useruni= data.university
        },
        updateToken(state, access){
            state.access = access
        },
        removeToken(state){
            localStorage.removeItem('useruni');
            localStorage.removeItem('nickname');
            localStorage.removeItem('access');
            localStorage.removeItem('refresh');

            state.access = ''
            state.refresh = ''
            state.nickname = ''
            state.useruni = ''
        },
    },
    actions: {
        obtainToken(context, payload){
            axios.post(this.state.endpoints.obtainJWT, payload)
                .then(response =>{
                    this.commit('updateTokenAndUserData', response.data);
                }).catch((error)=>{
                    console.log(error);
                })
        },
        refreshToken(){
            axios.post(this.state.endpoints.refreshJWT, {token: this.state.refresh})
                .then((response)=>{
                    this.commit('updateToken', response.data.access)
                })
                .catch((error)=>{
                    console.log(error)
                })
        },
        inspectToken(){
            // WE WILL ADD THIS LATER
        },
    }
})


