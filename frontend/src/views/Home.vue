<template>
    <div>
        <div style="height:600px;text-align:center;background-image: URL(http://ww1.sinaimg.cn/large/006tNc79gy1g4fxoimyeij30p00e6jrl.jpg);background-size: cover">
            <div style="font-size:3em;padding-top:80px;color:white"><b style="font-size:1em;color:#fce054">클릭 한 번</b>으로!</div>
            <div style="font-size:3em;padding-bottom:20px;color:white">쉽고 빠르게 시험 대비하기</div>
            <div class="gif" style="border-radius: 0.5em;box-shadow: 0 10px 5px #c2bfbe;background-color:white;height:200px; width:500px;display: inline-block;">
                <div class="input-field">
                    <div style="padding-bottom: 20px">
                        <div style="padding-bottom:10px;float:left;font-size:24px;"><b>숙명여자대학교 시각영상디자인전공</b></div>
                    <input placeholder="🔍 과목명, 교수명으로 검색" style="width:400px;border-bottom: 5px solid #8a7afa;" type="text" v-model="subject">
                    </div>
                    <v-btn style="width:200px;font-size:18px;color:white;background-color:#d0c9fd" @click.native.stop="searchBegin">
                        <b>족보 검색하기</b>
                    </v-btn>
                    <div :class="{'searching--closed': !searching}" class="searching">
                </div>
            </div>
            </div>
        </div>
        <div class="gif">
            <img src="../assets/1.jpg">
            <img src="http://ww3.sinaimg.cn/large/006tNc79gy1g4g6vgfjdsg30zk0k04ky.gif">
            <img src="../assets/2.jpg">
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
            axios({ method: "GET", "url": "http://127.0.0.1:8000/api/post" }).then(result => {
                this.dummy = result.data;
            }, error => {
                console.error(error);
            });
        },

        methods: {
            searchBegin() {
                axios({ method: "GET", "url": "http://127.0.0.1:8000/api/post?university=1&subject=" + this.subject}).then(result => {
                    this.$store.state.jockboList = result.data;
                    this.$router.push({ path: '/jockbolist' });
                }, error => {
                    console.error(error);
                });
            }
        }
    }
</script>

<style scoped>
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
        font-size:18px;

    }

    #wrapper {
        padding-top:10px;
        width: 960px;
        margin: 0 auto;
        /*border-style:solid;*/
    }
    .gif {
        text-align:center;
    }
    .gif img {
        width:960px;
    }
    @media screen and (max-width: 960px) {
        .gif img {
            width:100%;
        }
        .gif div {

        }

    }

    input[type="text"], input[type="password"], textarea, select {
        outline: none;
    }
</style>


