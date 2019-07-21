<template>
    <v-app>
        <div class="wrapper">
            <v-toolbar
                    app
                    flat
                    dense
                    color="white"
                    style="opacity: 0.80;"
                    dark
                    height="70"
                    width="960"
            >
                <v-spacer></v-spacer>
                <img style="height:40px;padding-right:15px;"src="../assets/favicon.png">
                <div class="v-toolbar-title">
                    <router-link to="/"><h2 style="color:#989898;text-decoration:none">Jokjebi</h2></router-link>
                </div>
                <v-spacer></v-spacer>
                    <div class="hideit" style="padding-right:40px">
                        <!-- <router-link to="/jockbolist"><h2 style="color:#7d7d7d;font-size:15px"><b>스크랩한 족보</b></h2>
                        </router-link> -->
                        <a @click="onClickGetUserScrapedData"><h2 style="color:#7d7d7d;font-size:15px"><b>스크랩한 족보</b></h2>
                        </a>
                    </div>

                    <div class="hideit" style="padding-right:70px">
                        <router-link to="/createjockbo"><h2 style="color:#7d7d7d;font-size:15px"><b>족보 업로드</b></h2>
                        </router-link>
                </div>
                <div style="border-left: 1px solid #e5e5e5; height: 70px;"></div>
                <div style="padding-left:20px;padding-right:40px">

                    <v-tooltip bottom>
                        <v-btn icon @click.stop="rightDrawer = !rightDrawer" slot="activator">
                            <v-badge color="#FDC335" overlap>
                                <span slot="badge">5</span>
                                <v-icon color="#b0b0b0">mail_outline
                                </v-icon>
                            </v-badge>
                        </v-btn>
                        <span>2 unread notifications</span>
                    </v-tooltip>

                    <v-tooltip bottom>
                        <v-btn icon @click.stop="rightDrawer = !rightDrawer" slot="activator">
                            <v-badge color="#FDC335" overlap>
                                <span slot="badge">2</span>
                                <v-icon color="#b0b0b0">notifications_none</v-icon>
                            </v-badge>
                        </v-btn>
                        <span>2 unread notifications</span>
                    </v-tooltip>

                </div>

                <div style="padding-right:20px">
                    <v-menu offset-y>
                        <v-btn icon slot="activator">
                            <v-avatar class="white" size="32">
                                <h2 style="color:#796ef6;font-size:15px">{{loginUser}}</h2>
                            </v-avatar>
                        </v-btn>


                        <v-list class="pa-0" light>
                            <v-list-tile avatar>
                                <v-list-tile-avatar>
                                    <v-avatar class="deep-purple accent-2" size="48px">
                                        <v-icon dark>sentiment_satisfied_alt</v-icon>
                                    </v-avatar>
                                </v-list-tile-avatar>
                                <v-list-tile-content>
                                    <v-list-tile-title>{{this.$store.state.nickname}}</v-list-tile-title>
                                    <v-list-tile-sub-title>{{this.$store.state.useruni}}</v-list-tile-sub-title>
                                </v-list-tile-content>
                            </v-list-tile>
                            <v-divider></v-divider>
                            <v-list-tile key="profile" @click="showSignupModal">
                                <v-list-tile-action>
                                    <v-icon>person</v-icon>
                                </v-list-tile-action>
                                <v-list-tile-content>
                                    <v-list-tile-title >회원가입</v-list-tile-title>
                                </v-list-tile-content>
                            </v-list-tile>
                            <v-divider></v-divider>
                            <v-list-tile key="lock_open" @click="onClickloginLogoutButton">
                                <v-list-tile-action>
                                    <v-icon>lock_open</v-icon>
                                </v-list-tile-action>
                                <v-list-tile-content>
                                    <v-list-tile-title>{{loginState}}</v-list-tile-title>
                                </v-list-tile-content>
                            </v-list-tile>
                        </v-list>
                    </v-menu>
                </div>
                <v-spacer></v-spacer>
            </v-toolbar>
        </div>


        <div class="signin-modal" @click="closeSigninModal">
            <div class="auth-modal-body" @click="blockPropagate">
                <input placeholder="User ID"type="text" v-model="username">
                <label for="male"></label>
                <input placeholder="Password" type="password" v-model="password">
                <button style="backgroud-color:black" class="login-button" @click="login"><b>로그인</b></button>
                <div style="padding:50px 0px 0px 100px;color:white">비밀번호를 잊으셨나요? | <b style="color:#FDC335;">회원가입</b></div>
            </div>
        </div>

        <div class="signup-modal" @click="closeSignUpModal">
            <div class="auth-modal-body" @click="blockPropagate">
                <input placeholder="User ID"type="text" v-model="username">
                <div style="padding-top:20px;"></div>
                <input placeholder="Password" type="password" v-model="password1">
                <input placeholder="Repeat Password" type="password" v-model="password2">
                <div style="padding-top:20px;"></div>
                <input placeholder="university" type="text" v-model="university">
                <button style="backgroud-color:black" class="login-button" @click="signup"><b>회원가입</b></button>
            </div>
        </div>
    </v-app>
</template>

<script>
    export default {
        data() {
            return {
                username: '',
                password: '',
                password1: '',
                password2: '',
                university: '',
            }
        },
        computed: {
            loginState() {
                if(this.$store.state.access) 
                    return '로그아웃'
                else 
                    return '로그인'
            },
            loginUser() {
                if(this.$store.state.nickname) 
                    return this.$store.state.nickname
                else 
                    return '로그인'
            },   
        },
        methods: {
            onClickloginLogoutButton() {
                if(this.$store.state.access) {
                    this.$store.commit('removeToken')
                }
                else {
                    this.showSigninModal()
                }
            },
            showSignupModal(event) {
                let signupModal = document.getElementsByClassName('signup-modal')[0]
                signupModal.style.display = 'flex';
            },
            closeSignUpModal() {
                let signupModal = document.getElementsByClassName('signup-modal')[0]
                signupModal.style.display = 'none';
                this.password1 = '';
                this.password2 = '';
                this.username = '';
                this.university = '';
            },
            showSigninModal(event) {
                let signinModal = document.getElementsByClassName('signin-modal')[0]
                signinModal.style.display = 'flex';
            },
            closeSigninModal(event) {
                let signinModal = document.getElementsByClassName("signin-modal")[0];
                signinModal.style.display = 'none'
                this.username = '';
                this.password = '';
            },
            blockPropagate(event) {
                event.stopPropagation();
            },
            signup() {
                axios({
                    method: 'post',
                    url: '/api/signup',
                    data: {
                        username: this.username,
                        password1: this.password1,
                        password2: this.password2,
                        university: this.university
                    },
                }).then((response) => {
                    this.closeSignUpModal()
                }).catch(err => alert(err)) 
            },
            getUserScrapedData() {
                return axios({
                    method: 'get',
                    url: '/api/post?bookmark=true',
                    headers: {
                        authorization: this.$store.state.access,
                    },
                })
            },
            onClickGetUserScrapedData() {
                this.getUserScrapedData()
                .then((response) => {
                    this.$store.state.jockboList=response.data;
                    this.$router.push('/jockbolist');
                })
                .catch((error) => {
                    this.showSigninModal()
                })
            },
            login() {
                this.$store.dispatch('obtainToken', {email:this.username, password:this.password})
                .then(() => this.afterLoginSuccess())
                .catch(error => alert(error))
            },
            afterLoginSuccess() {
                this.closeSigninModal()
                this.password = ''
                this.username = ''
            }
        }
    }
</script>

<style scoped lang="stylus">
    @import '../../node_modules/vuetify/src/stylus/settings/_variables.styl';
    a {
        text-decoration: none;
    }
  

    @media screen and (max-width: 960px) {
        .hideit {
            display: none;
        }

    }

    .bottom-menu {
        position: absolute;
        width: 100%;
        bottom: 0;
    }

    .searching {
        overflow: hidden;
        width: 208px;
        padding-left: 8px;
        transition: $primary-transition;
    }

    .searching--closed {
        padding-left: 0;
        width: 0;
    }

    .searching > * {
        right: 8px;
    }

    .searching--closed > * {
        display: none;
    }

    .hidden-searching {
        @media $display-breakpoints.sm-and-down {
            display: none !important;
        }
    }

    .list-border-bottom {
        border-bottom: 1px solid rgba(255, 255, 255, 0.12);
    }

    .wrapper {
        margin-right: auto; /* 1 */
        margin-left: auto; /* 1 */
        max-width: 960px; /* 2 */
        padding-right: 10px; /* 3 */
        padding-left: 10px; /* 3 */
    }

    .signin-modal, .signup-modal {
        display: none;

        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;

        z-index: 3;

        background-color: rgba(0, 0, 0, 0.5);

        align-items: center;
        justify-content: center;
    }

    .auth-modal-body {
        align-items: center;
        justify-content: center;
        width: 400px;
        height: 400px;
        padding-top: 50px;
        background-color: #6A4CEF;
        opacity: 0.8;

        border-radius: 30px;
    }
    ::placeholder {
        color:white;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;

        height: 100%;

        border: 1px solid black;
    }

    label, input {
        display: block;
        width: 60%;
        height: 40px;
        margin: auto;
    }

    input {
        background-color: #6A4CEF;
        color:white;
        border: 0;
        outline: 0;
        border-bottom: 2px solid #FDC335;
    }

    .login-button {
        margin-top: 50px;
        margin-left: 100px;
        width: 200px;
        height: 50px;
        border-radius: 10px;
        background-color: #FDC335;
        color:white;
        font-size:17px;
    }

    input[type="text"], input[type="password"], textarea, select {
        outline: none;
    }
</style>

