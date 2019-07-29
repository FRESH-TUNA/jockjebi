<template>
    <div class="jockboList">
        <div class="search-bar">
            <input type="text" placeholder="족보 검색하기" v-model="subject">
            <button type="button" @click="search"><img src="https://image.flaticon.com/icons/svg/149/149852.svg"></button>
        </div>
        <div class="jockboList-body">
            <div class="left-nav-bar" style="padding-left:20px;background-color:#fefefe">
                <div style="font-size:1.5em;color:#4758dd"><b>검색 설정</b></div>
                <div style="padding-top:10px;">
                    <div style="font-size:1.2em;">대학교 이름</div>
                    <input type="text" name="1" value="1" v-model="university" class="form-text" style="margin-top:5px;">
                </div>

                <div style="padding-top:20px;">
                    <div style="font-size:1.2em;">교수님 성함</div>
                    <input type="text" name="1" value="1" v-model="professorName" class="form-text" style="margin-top:5px;">
                </div>

                <div style="padding-top:20px;">
                    <div style="font-size:1.2em;">학기</div>
                    <input type="checkbox" name="1" v-model="semester" :value="1" id="radio-one" class="form-radio"><label
                        for="radio-one"> 1학기</label>
                    <br/>
                    <input type="checkbox" name="1" v-model="semester" :value="2" id="radio-one" class="form-radio"><label
                        for="radio-one"> 여름학기</label>
                    <br/>
                    <input type="checkbox" name="1" v-model="semester" :value="3" id="radio-one" class="form-radio"><label
                        for="radio-one"> 2학기</label>
                    <br/>
                    <input type="checkbox" name="1" v-model="semester" :value="4" id="radio-one" class="form-radio"><label
                        for="radio-one"> 겨울학기</label>
                </div>

                <div style="padding-top:20px;">
                    <div style="font-size:1.2em;">정렬</div>
                    <input type="radio" name="sort" value="recently" v-model="sort" id="radio-one" class="form-radio"><label
                        for="radio-one">최신 족보 순</label>
                    <br/>
                    <input type="radio" name="sort" value="like" v-model="sort" id="radio-one" class="form-radio"><label
                        for="radio-one">좋아요 순</label>
                </div>

                <!-- <div style="padding-top:30px; padding-bottom:50px">
                    <div style="font-size:1.2em">연도</div>
                    <div style="padding-left:10px;width:150px;">
                        <vue-slider v-model="yearValue"
                                    :min="2009"
                                    :max="2019"
                                    :marks="marks1"
                                    :interval="1"
                                    :process-style="{ backgroundColor: '#f5c453' }"
                                    :tooltip-style="{ backgroundColor: '#f5c453', borderColor: '#f5c453' }"
                                    :tooltip-formatter="formatter1">
                            <template v-slot:dot="{ value, focus }">
                                <div :class="['custom-dot', { focus }]"></div>
                            </template>
                        </vue-slider>
                    </div>
                </div> -->
                <div>
                    <div style="font-size:1.2em; padding-top:30px;">정답 및 해설</div>
                    <input type="checkbox" name="demo" v-model="haveAnswer" value="true" id="radio-one" class="form-radio"><label
                        for="radio-one"> 해설 있는것만 검색</label>
                </div>

                <div>
                    <div style="font-size:1.2em; padding-top:30px;">스크랩</div>
                    <input type="checkbox" name="demo" v-model="bookmark" value="true" id="radio-one" class="form-radio"><label
                        for="radio-one"> 스크랩 한것만 검색</label>
                </div>
            </div>


            <div class="jockboBundle">
                <h2>
                    관련된 족보가 <b style="color:#6256f5;">{{jockboList.length}}</b>개있네요!
                </h2>

                <div style="padding: 20px 20px 20px 20px" class="jockbo" v-for="item in jockboList" v-bind:key="item.id">
                    <div @click="detail(item.id)" style="font-size:16px;"><b>{{item.subject}} </b><b style="color:#f5c353;">★</b> <span
                            style="font-size:13px;">3.5</span></div>
                    <span style="padding-right:20px;">{{item.year}}년 {{item.semester}}학기</span>
                    <span>전공필수 | {{item.professor}}</span>
                    <div style="display: flex;">
                        <div style="font-size:13px; padding-top:10px;">2018.7.14등록 - 다운로드 139건, 스크랩 81</div>
                        <div class="hidden" style="font-size:20px;color:#212121;padding: 0px 0px 0px 160px">
                            <img style="height:20px;"src="http://ww1.sinaimg.cn/large/006tNc79gy1g4go4qtywqj30e80e8aaj.jpg">
                            25 크레딧
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import VueSlider from 'vue-slider-component'
    import 'vue-slider-component/theme/antd.css'

    export default {
        components: {
            VueSlider
        },
        data() {
            return {
                jockboList: [],

                subject: '',
                university: '',
                professorName: '',
                semester: [1, 2, 3, 4],
                sort: 'recently',
                haveAnswer: false,
                bookmark: false,
            }
        },
        async mounted() {
            await this.$store.dispatch('inspectToken')
            this.subject = this.$route.query.subject
            this.university = this.$route.query.university ? this.$route.query.university : ''
            this.bookmark = this.$route.query.bookmark ? true : false
            this.readJockbos()
        },
        watch: {
            //뒤로가기나 앞으로갈때 갱신
            '$route.fullPath'(to) {
                this.subject = this.$route.query.subject
                this.haveAnswer = this.$route.query.haveAnswer
                this.bookmark = this.$route.query.bookmark
                this.sort = this.$route.query.sort
                this.university = this.$route.query.university ? this.$route.query.university : ''
                this.semester = this.$route.query.semester ? this.$route.query.semester : [1, 2, 3, 4]
                this.professorName = this.$route.query.professorName ? this.$route.query.professorName : ''
                this.readJockbos()
            },
        },
        methods: {
            detail(id) { this.$router.push({ name: 'detail', params: {id}})},
            readJockbos() {
                const index = this.$route.fullPath.indexOf('?')

                axios({
                    method: "GET",
                    url: "/api/post" + this.$route.fullPath.substring(index),
                    headers: {
                        authorization: this.$store.state.access,
                    },
                }).then(result => {
                    this.jockboList = result.data;
                }, error => {
            
                });
            },
            async search() {
                let query = '?subject=' + this.subject
                console.log(this.bookmark)
                console.log(this.bookmark === true)
                if(this.university !== '') 
                    query += '&university=' + this.university
                if(this.professorName !== '')
                    query += '&professorName=' + this.professorName
                if(this.haveAnswer === true)
                    query += '&haveAnswer=' + 'true'
                if(this.bookmark === true) 
                    query += '&bookmark=' + 'true'
                if(this.semester.length !== 4) {
                    this.semester.map(element => {
                        query += '&semester=' + element
                    })
                }
                if(this.sort === 'recently')
                    query += '&sort=' + 'recently'
                else if(this.sort === 'like')
                    query += '&sort=' + 'like'

                await this.$store.dispatch('inspectToken')
                this.$router.push('/jockbolist' + query)
            }
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    .form-text {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        background-color: #fefefe;
        color: #666;
        height: 30px;
        border: 1px solid #f6c548;
        border-radius: 2em;
        outline: none;
        padding-left: 0.5em;
    }

    .form-radio {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        display: inline-block;
        position: relative;
        background-color: #fefefe;
        color: #666;
        top: 5px;
        height: 20px;
        width: 20px;
        border: 1px;
        border-style: solid;
        border-color: #f6c548;
        border-radius: 50px;
        cursor: pointer;
        margin-right: 7px;
        outline: none;
    }

    .form-radio:checked::before {
        background: #f6c548;

    }

    .form-radio:hover {
        background-color: #f7f7f7;
    }

    .form-radio:checked {
        background: #f6c548;
    }

    label {
        font: 15px/1.7 'Open Sans', sans-serif;
        color: #333;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        cursor: pointer;
    }

    .form-checkbox {
        border-radius: 3px;
    }

    .form-radio {
        border-radius: 50px;
    }


    .custom-dot {
        width: 100%;
        height: 100%;
        border-radius: 100%;
        background-color: #f5c453;
        transition: all .3s;
    }

    .custom-dot:hover {
        transform: rotateZ(45deg);
    }

    .custom-dot.focus {
        border-radius: 50%;
    }

    .jockboList {
        display: flex;
        flex-flow: column;
        align-items: center;
        background-color: rgb(243, 243, 243);

        padding-top: 10px;
        height: 100%;
        font-family: BBTreeGB
    }

    .jockboList-header {
        margin-top: 20px;
        margin-left: auto;
        margin-right: auto;

        height: 50px;
        width: 800px;

        background-color: white;
    }

    .status-header {
        margin-top: 20px;
        margin-left: auto;
        margin-right: auto;

        height: 50px;
        width: 800px;
        border: 1px solid black;
    }

    .status-header-item {
        display: inline-block;
        line-height: 50px;
    }

    .search-field-label {
        padding-right: 150px;
    }

    .jockboList-body {
        padding-top: 10px;
        width: 800px;

        display: flex;
        justify-content: space-between;
    }

    .left-nav-bar {
        padding-top: 20px;
        display: inline-block;
        width: 200px;
        height: 100vh;
    }

    .left-nav-bar-item {
        border: 1px solid black;
        margin-top: 5px;
        height: 80px;
    }

    .jockboBundle {
        display: inline-block;
        width: 590px;
        height: 100vh;
        overflow: scroll;
        background-color: rgb(254, 254, 254);
        padding: 20px 20px 20px 20px;
    }

    .jockbo {
        width: 550px;

        margin-top: 20px;
        background-color: white;
        border: 0.5px solid rgb(200, 200, 200);

        border-radius: 10px;
    }

    .search-bar {
        width: 800px;
        height: 50px;
        background-color: white;

        display: flex;
        justify-content: flex-end;
    }

    .search-bar input{
        flex-grow: 1;
        font-size: 1.5em;
        padding: 0 1em;
    }
    .search-bar input:focus{ outline: none; }

    .search-bar button{ 
        width: 50px;
        padding: 10px;
    }

    @media screen and (max-width: 1000px) {
        .hidden{
            display: none;
        }
        .jockboList {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .jockboList-header, .jockboList-body {
            width: 100%;
        }

        .jockboBundle {
            width: 100%;
            height: auto;

            display: flex;
            flex-flow: column;
            justify-content: center;
            align-items: center;
        }

        .left-nav-bar {
            display: none;
        }

        .jockbo {
            width: 300px;
            height: 100px;
            margin-top: 5px;
            border: 1px solid black;
        }
    }
</style>

