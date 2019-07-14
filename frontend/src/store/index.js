import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        jockboList: [],
        searchSubject: '',

        jwt: localStorage.getItem('t'),
        username: localStorage.getItem('username'),
        useruni: localStorage.getItem('useruni'),

        endpoints: {
            obtainJWT: '/token',
            refreshJWT: '/refresh'
        },
    },
    mutations: {
        updateToken(state, newToken){
            localStorage.setItem('t', 'jwt ' + newToken);
            state.jwt = 'jwt ' + newToken;
        },
        removeToken(state){
            localStorage.removeItem('t');
            localStorage.removeItem('username');
            localStorage.removeItem('useruni');
            state.jwt = null;
            state.username = null,
            state.useruni= null
        },
        setUsername(state, username){
            state.username = username
            localStorage.setItem('username', username);
        },
        setUni(state, uni){
            state.useruni = uni
            localStorage.setItem('useruni', uni);
        }
    },
    actions: {
        obtainToken(context, payload){
            axios.post(this.state.endpoints.obtainJWT, payload)
                .then(response =>{
                    this.commit('updateToken', response.data.token);
                    this.commit('setUsername', payload.username);
                    return context.dispatch('getuseruni')
                }).then(response => {
                    this.commit('setUni', response.data.title);
                })
                .catch((error)=>{
                    console.log(error);
                })
        },
        refreshToken(){
            axios.post(this.state.endpoints.refreshJWT, {token: this.state.jwt})
                .then((response)=>{
                    this.commit('updateToken', response.data.token)
                })
                .catch((error)=>{
                    console.log(error)
                })
        },
        inspectToken(){
            // WE WILL ADD THIS LATER
        },
        getuseruni() {
            return axios({
                method: 'get',
                url: '/api/getuseruni',
                headers: {
                    authorization: this.state.jwt,
                },
            })
        }
    }
})


