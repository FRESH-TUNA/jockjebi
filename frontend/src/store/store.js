import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export const store = new Vuex.Store({
    state: {
        rightMenuState: false
    },
    mutations: {
        changeRightMenuState: function () {
            let menu = document.getElementsByClassName("right-menu");
            let container = document.getElementsByClassName('header-button-container')

            if(this.state.rightMenuState === true) {
                menu[0].style.right = '-200px';  
                container[0].style.paddingRight = '5px';
                this.state.rightMenuState = false;
            }
            else {
                menu[0].style.right = '0px';
                container[0].style.paddingRight = '205px';
                this.state.rightMenuState = true;
            }
        }
    }
});