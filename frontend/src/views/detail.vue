<template>
    <div id="wrapper">
        <div style="background-color:#fefefe">
        <div style="padding-left:110px">
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
                        <button style="font-size:15px;color:white;background-color:#5f52ed;width:100px;height:40px;border-style:solid;border-radius: 10px;">다운로드</button>
                    </div>
                    <div>
                        <button style="font-size:15px;color:#0729d4;background-color:#ffffff;width:100px;height:40px;border-style:solid;border-radius: 10px;">추천하기</button>
                    </div>
                </div>
            </span>
            </div>

            <div style="padding-left:20px">
                <div style="padding-bottom:20px;color:#6c60f5;font-size:18px;"><b>업로더의 코멘트</b></div>

                <div>2019~~</div>

                <div style="padding-top:50px;">
                    <div style="font-size:18px; color:#6c60f5"><b>댓글(18)</b></div>
                    <br/>
                    <div><b>우울한 아르마딜로</b></div>
                    <br/>
                    <div><b>배고픈 호랑이</b></div>
                    <br/>
                    <div><b>방탕한 고슴도치</b></div>
                    <br/>
                    <div style="font-size:18px; color:#6c60f5"><b>의견 남기기</b></div>
                    <div style="display: flex;">
                        <div style="border-style:solid;width:900px;">
                            <star-rating :max="5"
                                         :star-size="20"
                                         :rounded-corners="true"
                                         :fixed-points="3"
                                         :show-rating="false"
                                         style="inline"
                            ></star-rating>
                            <textarea rows="4" cols="50">
At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies.
</textarea>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        </div>
    </div>

</template>

<script>
    import StarRating from 'vue-star-rating'

    export default {
        components: {
            StarRating
        },
    }

</script>

<style scoped>
    #wrapper {
        padding-top:10px;
        width: 960px;
        margin: 0 auto;
        /*border-style:solid;*/
    }
</style>
