import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        jockboList: [],
        searchSubject: '',
        authModalState: false,

        jwt: localStorage.getItem('t'),

        endpoints: {
            obtainJWT: 'http://127.0.0.1:8000/token',
            refreshJWT: 'http://127.0.0.1:8000/refresh'
        },

        username: '로그인', 
        useruni: ''
    },
    mutations: {
        changeAuthModalState: function() {
            let authModal = document.getElementsByClassName("auth-modal")[0];

            if(this.state.authModalState === false) {
                authModal.style.display = 'flex'
                this.state.authModalState = true
            }
            else {
                authModal.style.display = 'none'
                this.state.authModalState = false
            }
        },
        updateToken(state, newToken){
            localStorage.setItem('t', 'jwt ' + newToken);
            state.jwt = 'jwt ' + newToken;
        },
        removeToken(state){
            localStorage.removeItem('t');
            state.jwt = null;
        }
    },
    actions: {
        obtainToken(username, password){
            const payload = {
            username: password.username,
            password: password.password
            }
            axios.post(this.state.endpoints.obtainJWT, payload)
            .then((response)=>{
                console.log(response.data.token)
                this.commit('updateToken', response.data.token);
                this.state.username = payload.username
                })
            .catch((error)=>{
                console.log(error);
                })
        },
        refreshToken(){
            const payload = {
            token: this.state.jwt
            }
            axios.post(this.state.endpoints.refreshJWT, payload)
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
        userAttentation() {
            axios({
                method: 'post',
                url: 'http://127.0.0.1:8000/api/userdata', 
                headers: {
                    authorization: this.$store.state.jwt,
                },
            }).then((response) => {this.$store.state.userData = response.data})
        }
    }
})


