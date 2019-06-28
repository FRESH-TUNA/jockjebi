<template>
    <div class="jockboList">
        <div class="jockboList-body">
            <div class="left-nav-bar" style="padding-left:20px;background-color:#fefefe">
                <div style="font-size:1.5em;color:#4758dd"><b>검색 필터</b></div>
                <div style="padding-top:30px; padding-bottom:50px">
                    <div style="font-size:1.2em">연도</div>
                    <div style="padding-left:10px;width:150px;">
                        <vue-slider v-model="value1"
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
                </div>
                <div style="padding-bottom:30px;">
                    <div style="font-size:1.2em;">학기</div>
                    <input type="radio" name="1" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 1학기</label>
                    <br/>
                    <input type="radio" name="1" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 여름학기</label>
                    <br/>
                    <input type="radio" name="1" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 2학기</label>
                    <br/>
                    <input type="radio" name="1" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 겨울학기</label>
                    <br/>
                </div>
                <div style="font-size:1.2em">평점</div>
                <div style="padding-left:10px;width:150px;">
                    <vue-slider v-model="value1" :min="0"
                                :max="5"
                                :marks="marks2"
                                :interval="1"
                                :process-style="{ backgroundColor: '#F5C453' }"
                                :tooltip-style="{ backgroundColor: '#F5C453', borderColor: '#F5C453' }"
                                :tooltip-formatter="formatter1">
                        <template v-slot:dot="{ value, focus }">
                            <div :class="['custom-dot', { focus }]"></div>
                        </template>
                    </vue-slider>
                </div>
                <div>
                    <div style="font-size:1.2em; padding-top:50px;">유형</div>
                    <input type="radio" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 전공필수</label>
                    <br/>
                    <input type="radio" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 전공선택</label>
                    <br/>
                    <input type="radio" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 필수교양</label>
                    <br/>
                    <input type="radio" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 교선핵심</label>
                    <br/>
                    <input type="radio" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 공통</label>
                </div>
                <div>
                    <div style="font-size:1.2em; padding-top:50px;">정답 및 해설</div>
                    <input type="checkbox" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 해설있음</label>
                </div>
            </div>


            <div class="jockboBundle">
                <h2>
                    관련된 족보가 <b style="color:#6256f5;">{{jockboList.length}}</b>개있네요!
                </h2>
                <div class="jockbo" v-for="item in jockboList" key="item.id">
                    <div class="headline mb-0">{{item.subject}}</div>
                    <span class="headline mb-0">{{item.year}}-{{item.semester}}학기</span>
                    <span class="headline mb-0">{{item.professor}} 교수님</span>
                    <div>2018.7.14등록   다운로드 139건, 스크랩 81</div>
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
                value: '2009',
                formatter1: '{value}',
                marks1: {'2009': '2009', '2019': '2019'},
                marks2: {'0': '0', '5': '5'},
                data: ['2009', '2019'],
                value2: '1',
                data2: ['1', '5'],
                jockboList: []
            }
        },
        mounted() {
            // axios({ method: "GET", "url": "http://127.0.0.1:8000/api/post" }).then(result => {
            //     this.jockboList = result.data;
            // }, error => {
            //     console.error(error);
            // });
            this.jockboList = this.$store.state.jockboList;
        },
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@font-face { font-family: 'BBTreeGB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGB.woff') format('woff'); font-weight: normal; font-style: normal; }
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
        /*justify-content: center;*/
        align-items: center;
        background-color: rgb(243, 243, 243);

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
        height: 80px;
        margin-top: 20px;
        background-color: white;
        display: flex;
        align-items: center;
        justify-content: space-around;
        border: 2px solid rgb(200, 200, 200);
        border-radius: 10px;
    }

    @media screen and (max-width: 1000px) {
        .jockboList {
            border: 1px solid black;
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

