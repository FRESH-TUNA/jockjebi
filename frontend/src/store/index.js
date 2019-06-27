import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        jockboList: [],
        searchSubject: '',
        authModalState: false
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
        }
    },
    actions: {}
})
