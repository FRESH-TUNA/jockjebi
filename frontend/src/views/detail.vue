<template>
    <div id="wrapper">
        <div style="background-color:#fefefe;height:100vh;">
            <div style="padding-left:110px;padding-right:140px">
                <div style="display: flex;">
                    <img src="https://skkujokbo.com/download/5d10e796e9e85546035e7d45/preview/0"
                         style="padding: 40px 20px 20px 20px;width:240px; height:320px;border-radius: 30px; ">
                    <span style="padding: 40px 20px 20px 20px">
                <div style="font-size:17px;">2018년도 1학기</div>
                <div style="display: flex;">
                    <span style="padding-right:5px;font-size:25px;"><b>시각영상디자인원론</b></span>
                    <star-rating :max="5"
                                 :star-size="13"
                                 :rounded-corners="true"
                                 :fixed-points="3"
                                 :show-rating="false"
                    ></star-rating>
                </div>
                <div style="font-size:17px">전공필수 | 이미진</div>
                <br/>
                <div>조회수 180회 | 다운로드 94건</div>
                <div>정답및 해설 있음</div>
                <br/>
                <div>2018.7.14(수)에 <b style="color:#6c60f5">답답한 토끼</b>가 업로드함</div>
                <br/>
                <div style="display: flex">
                    <div style="padding-right:10px;">
                        <button style="font-size:15px;color:white;background-color:#5f52ed;width:100px;height:40px;border-style:solid;border-radius: 10px;"><b>다운로드</b></button>
                    </div>
                    <div>
                        <button style="font-size:15px;color:#0729d4;background-color:#ffffff;width:100px;height:40px;border-style:solid;border-radius: 10px;"><b>추천하기</b></button>
                    </div>
                </div>
            </span>
                </div>

                <div style="padding-left:20px">
                    <div style="padding-top:20px;padding-bottom:20px;color:#6c60f5;font-size:18px;"><b>업로더의 코멘트</b>
                    </div>

                    <div style="padding-bottom:30px;font-size:15px;">2019 1학기 중간, 기말고사 범위는 2019년 교안에 맞게 직접 정리하였고, 중간고사 시험 직후 어떤 문제가 나왔는지 대충 정리한 것 입니다.<br/>
                        기말고사 범위는 족제비에 올라왔던 정리된 것을 새 교안에 맞게 제 방식으로 추가한 것입니다.<br/>
                    급하게 한 거라 순서가 이상하고 겹치는 부분도 꽤 있지만 강의에 나왔던 중요한 내용은 다 있습니다.</div>


                    <div style="margin-left:-140px;width:2000px;height:10px;background-color: #fafafa;"></div>


                    <div style="padding-top:30px;">
                        <div style="font-size:18px; color:#6c60f5"><b>댓글(18)</b></div>
                        <br/>
                        <div v-for="comment in comments" style="padding: 10px 10px 10px 10px;border-style:solid;width:690px;border-radius:10px;border-width:1px;border-color:#e4e4e4">
                            <div style="display: flex;">
                                <div style="padding-right:10px;"><b>우울한 아르마딜로</b></div>
                                <star-rating :max="5"
                                             :star-size="13"
                                             :rounded-corners="true"
                                             :fixed-points="3"
                                             :show-rating="false"
                                ></star-rating>
                            </div>
                            <div style="font-size:13px;">{{comment.content}}</div>
                            <!-- <div style="font-size:13px;">교양 재밌는거 들으세여 중간은 괜찮지만 기말ㅇ진짜 안그래도시험이랑 과제존많던데 이거범위전범위존나ㅏ빡쳐여시벌 다 교양도 비슷하다는앤걍바보스<br/>
                            아근데운건공부하다보면그거하난좋아여 건강하게살아야겠구나 술을 멀리하게된계기 ㄱㅅㄱㅅ 화이팅하세여</div> -->
                        </div>
                        <div style="padding: 10px 10px 10px 10px;border-style:solid;width:690px;border-radius:10px;border-width:1px;border-color:#e4e4e4">
                            <div style="display: flex;">
                                <div style="padding-right:10px;"><b>우울한 아르마딜로</b></div>
                                <star-rating :max="5"
                                             :star-size="13"
                                             :rounded-corners="true"
                                             :fixed-points="3"
                                             :show-rating="false"
                                ></star-rating>
                            </div>
                            <div style="font-size:13px;">교양 재밌는거 들으세여 중간은 괜찮지만 기말ㅇ진짜 안그래도시험이랑 과제존많던데 이거범위전범위존나ㅏ빡쳐여시벌 다 교양도 비슷하다는앤걍바보스<br/>
                                아근데운건공부하다보면그거하난좋아여 건강하게살아야겠구나 술을 멀리하게된계기 ㄱㅅㄱㅅ 화이팅하세여</div>
                        </div>
                        <div style="font-size:18px; padding-top:20px;color:#6c60f5"><b>의견 남기기</b></div>
                        <div style="display: flex;padding-top:10px;">
                            <div style="width:570px;display: flex;border-style:solid;border-color:#d6d6d6;border-radius:15px;border-width:1px;">
                                <div style="padding-left:10px;padding-right:20px;padding-top:10px;">
                                    <star-rating :max="5"
                                                 :star-size="20"
                                                 :rounded-corners="true"
                                                 :show-rating="false"
                                                 v-model="test"
                                    ></star-rating>
                                </div>
                                <div>
                            <textarea placeholder="비방성 댓글은 관리자에 의해 삭제될 수 있습니다." class="input-field" rows="4" cols="50"
                                      style="width:440px;" v-model="content">

                            </textarea>
                                </div>
                            </div>
                            <div style="padding-left:20px;">
                                <button style="font-size:15px;color:white;background-color:#5f52ed;width:100px;height:40px;border-style:solid;border-radius: 10px;" @click="postComment">
                                    <b>등록하기</b>
                                </button>
                            </div>
                        </div>
                        <!--                        <div style="font-size:18px; color:#6c60f5;padding-top:20px;"><b>이 사용자의 다른 족보</b></div>-->
                    </div>
                </div>

            </div>
        </div>
    </div>

</template>

<script>
    import StarRating from 'vue-star-rating'

    export default {
        data() {
            return {
                test: 3,
                content: '',
                comments: []
            }
        },
        components: {
            StarRating
        },
        methods: {
            readComments() {
                axios({
                    method: 'get',
                    url: '/api/comment',
                }).then((response) => {
                    this.comments = response.data
                })
            },
            postComment() {
                axios({
                    method: 'post',
                    url: '/api/comment',
                    data: {
                        content: this.content
                    },
                    headers: {
                        authorization: this.$store.state.jwt,
                    },
                }).then((response) => {
                    this.readComments()
                })
            }
        },
        mounted() {
            this.readComments()
        }
    }

</script>

<style scoped>
    #wrapper {
        padding-top: 10px;
        width: 960px;
        margin: 0 auto;
        /*border-style:solid;*/
    }

    .input-field {
        padding-top: 10px;
        display: inline-block;
        outline: none;
        font-size: 17px;
        height: 40px;
        color: #212121;
    }

    ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
        font-size: 13px;
        padding-top: 5px;
        color: #d5d5d5;
        opacity: 1; /* Firefox */
    }
</style>
