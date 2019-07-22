<template>
    <div>
        <div class="first-section" style="height:600px;text-align:center;  background-size: cover">
            <div style="font-size:3em;padding-top:80px;color:white"><b style="font-size:1em;color:#fce054">클릭 한 번</b>으로!
            </div>
            <div style="font-size:3em;padding-bottom:20px;color:white">쉽고 빠르게 시험 대비하기</div>
            <div id="hello"
                 style="border-radius: 0.5em;box-shadow: 0 10px 5px #292f64;background-color:white;height:200px; width:500px;display: inline-block;">
                <div class="input-field">
                    <div style="padding-bottom: 10px; padding-top:10px;">
                        <div style="float:left;font-size:24px;"><b>{{searchBarTitle()}}</b></div>
                        <input placeholder="🔍 과목명, 교수명으로 검색" style="width:400px;border-bottom: 2px solid #8a7afa;"
                               type="text" v-model="subject">
                    </div>
                    <div class="needpad" style="padding-top:20px;">
                        <v-btn class="searchBeginButton"
                               style="border-radius:10px;width:200px;height:50px;font-size:18px;color:white;background-color:#d0c9fd" @click="searchBegin">
                            <b>족보 검색하기</b>
                        </v-btn>
                    </div>
                    <!-- <div :class="{'searching--closed': !searching}" class="searching"> -->
                    <!-- </div> -->
                </div>
            </div>
        </div>
        <div id="image">
            <div class="gif">
                <div>
                    <img src="../assets/1.jpg">
                </div>
                <div>
                    <img style="border-style:solid;border-color:#f5c453" src="../assets/2.gif">
                </div>
                <div>
                    <img src="../assets/2.jpg">
                </div>
            </div>
        </div>
    </div>

</template>

<script>
    export default {
        data() {
            return {
                subject: '',
                dummy: [],
            }
        },
        mounted() {
            axios({method: "GET", "url": "/api/post"}).then(result => {
                this.dummy = result.data;
            }, error => {
                console.error(error);
            });
        },
        methods: {
            searchBarTitle: function() {
                if(this.$store.state.useruni)
                    return this.$store.state.useruni
                else
                    return '족보 검색하기'
            }   ,  
            async searchBegin() {
                let query = '?subject=' + this.subject

                if(this.$store.state.access) {
                    try {
                        const response = await this.$store.dispatch('inspectToken')
                    }
                    catch(error) {
                        try {
                            await this.$store.dispatch('refreshToken')
                        }
                        catch(error) {
                            this.$store.commit('removeToken')
                            alert('다시 로그인해주세요 호호')
                        } 
                    }
                }
                if(this.$store.state.useruni)
                    query += '&university=' + this.$store.state.useruni

                this.$router.push('/jockbolist' + query)
            }
        },
        computed: {
            sendToCondition () {
                console.log(this.$store.state.username);
                return this.$store.state.username
            }
        },

        watch: {
            subject: function () {
                let searchBeginButton = document.getElementsByClassName('searchBeginButton')[0]
                if (this.subject.length == 0)
                    searchBeginButton.style.backgroundColor = '#d0c9fd'
                else
                    searchBeginButton.style.backgroundColor = '#6A4CFF'
            },
            sendToCondition (newCount, oldCount) {
                console.log(newCount);
                if (newCount == "로그인")
                    document.getElementsByClassName("needpad")[0].style.padding = "20px";
                else
                    document.getElementsByClassName("needpad")[0].style.padding = "5px";
            }
        }
    }
</script>

<style scoped>
    .first-section {
        background-image: url('../assets/homebackground.jpg');
    }
    .outine-2 {
        border: 2px solid white;
    }

    .card--flex-toolbar {
        margin-top: -124px;
    }

    .learn-more-btn {
        text-transform: initial;
        text-decoration: underline;
    }

    .input-field {
        padding-top: 30px;
        display: inline-block;
        width: 400px;
        outline: none;
        font-size: 18px;
    }

    #image {
        background-image: url("../assets/3.jpg");
        background-color: #ebebeb;
        background-size: 100% 42.7%;

    }

    body {
        background-color: #ebebeb;
    }

    #wrapper {
        width: 960px;
        margin: 0 auto;
        /*border-style:solid;*/
    }

    .gif {
        text-align: center;
    }

    .gif img {
        width: 960px;
    }

    @media screen and (max-width: 960px) {
        .gif img {
            width: 100%;
        }
    }

    input[type="text"], input[type="password"], textarea, select {
        outline: none;
    }
</style>


