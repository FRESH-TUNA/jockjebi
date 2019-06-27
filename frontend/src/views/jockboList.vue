<template>
    <div class="jockboList">

        <div class="jockboList-body">
            <div class="left-nav-bar">
                <div style="font-size:1.5em">검색 필터</div>
                <div style="padding-top:30px; padding-bottom:50px">
                    <div style="font-size:1.2em">기간</div>
                    <div style="padding-left:10px;width:150px;">
                        <vue-slider v-model="value1"
                                    :min="2009"
                                    :max="2019"
                                    :marks="marks1"
                                    :interval="1"
                                    :process-style="{ backgroundColor: '#d8d8d8' }"
                                    :tooltip-style="{ backgroundColor: '#d8d8d8', borderColor: '#d8d8d8' }"
                                    :tooltip-formatter="formatter1">
                            <template v-slot:dot="{ value, focus }">
                                <div :class="['custom-dot', { focus }]"></div>
                            </template>
                        </vue-slider>
                    </div>
                </div>

                <div style="font-size:1.2em">평점</div>
                <div style="padding-left:10px;width:150px;">
                    <vue-slider v-model="value1" :min="0"
                                :max="5"
                                :marks="marks2"
                                :interval="1"
                                :process-style="{ backgroundColor: '#d8d8d8' }"
                                :tooltip-style="{ backgroundColor: '#d8d8d8', borderColor: '#d8d8d8' }"
                                :tooltip-formatter="formatter1">
                        <template v-slot:dot="{ value, focus }">
                            <div :class="['custom-dot', { focus }]"></div>
                        </template>
                    </vue-slider>
                </div>
                <div>
                    <div style="font-size:1.2em; padding-top:50px;">유형</div>
                    <input type="checkbox" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 전공필수</label>
                    <br/>
                    <input type="checkbox" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 전공선택</label>
                    <br/>
                    <input type="checkbox" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 필수교양</label>
                    <br/>
                    <input type="checkbox" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 교선핵심</label>
                    <br/>
                    <input type="checkbox" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 공통</label>
                </div>
                <div>
                    <div style="font-size:1.2em; padding-top:50px;">정답 및 해설</div>
                    <input type="checkbox" name="demo" value="one" id="radio-one" class="form-radio"><label
                        for="radio-one"> 해설있음</label>
                </div>
            </div>
            <div class="jockboBundle">
                <div>
                    관련된 족보가 있네요!
                </div>
                <div class="jockbo" v-for="item in jockboList" key="item.year">
                    <h5 class="headline mb-0">{{item.year}}-{{item.semester}}</h5>
                    <h5 class="headline mb-0">{{item.subject}}</h5>
                    <h5 class="headline mb-0">{{item.professor}}</h5>
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
            axios({method: "GET", "url": "http://127.0.0.1:8000/api/post"}).then(result => {
                this.jockboList = result.data;
            }, error => {
                console.error(error);
            });
        },
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    .form-radio {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        display: inline-block;
        position: relative;
        background-color: #d8d8d8;
        color: #666;
        top: 5px;
        height: 20px;
        width: 20px;
        border: 0;
        border-radius: 50px;
        cursor: pointer;
        margin-right: 7px;
        outline: none;
    }

    .form-radio:checked::before {
        position: absolute;
        font: 13px/1 'Open Sans', sans-serif;
        left: 5px;
        top: 5px;
        content: '\02143';
        transform: rotate(40deg);
    }

    .form-radio:hover {
        background-color: #f7f7f7;
    }

    .form-radio:checked {
        background-color: #f1f1f1;
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
        border-radius: 0;
        background-color: #d8d8d8;
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
        width: 1000px;

        display: flex;
        justify-content: space-between;
    }

    .left-nav-bar {
        padding-top: 20px;
        display: inline-block;
        width: 200px;
        height: 500px;
    }

    .left-nav-bar-item {
        border: 1px solid black;
        margin-top: 5px;
        height: 80px;
    }

    .jockboBundle {
        display: inline-block;
        width: 590px;
        height: 500px;
        overflow: scroll;
        background-color: rgb(200, 200, 200)
    }

    .jockbo {
        width: 550px;
        height: 80px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 20px;
        border: 1px solid black;

        background-color: white;
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

