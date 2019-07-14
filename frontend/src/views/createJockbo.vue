<template>
    <div id="wrapper">
        <div style="background-color: #fafafa;height:100vh;">
        <div style="padding-up:50px;padding-left:110px">
            <div style="padding: 20px 20px 20px 20px"><span  style="font-size:1.5em"><b>족보 업로드</b></span><span style="padding-right:450px;"></span><span style="padding-left:40px;text-align:left;font-size:1.0em">업로드가 처음이세요?</span></div><br/>
            <div class="text"style="padding: 20px 20px 5px 20px">
                <span style="padding-right:40px">
                    <label style="padding-right:20px;font-size:1.3em"for="male"><b>과목</b></label>
                    <input style="width:275px;height:25px;"type="text" v-model="subject">
                </span>
                <span>
                    <label style="padding-right:20px;font-size:1.3em"for="male"><b>교수</b></label>
                    <input style="width:275px;height:25px;"type="text" v-model="professor">
                </span>
            </div>
            <div class="text"style="padding: 5px 20px 20px 20px">
                <span style="padding-right:20px;">
                 <label style="padding-right:20px;font-size:1.3em"for="male"><b>연도</b></label>
                    <input style="width:100px;height:25px;"type="text" v-model="year">
                </span>
               <span style="padding-right:40px">
                    <label style="padding-right:23px;font-size:1.3em"for="male"><b>학기</b></label>
                    <input style="width:100px;height:25px;"type="text" v-model="semester">
               </span>
                <span>
                     <label style="padding-right:20px;font-size:1.3em"for="male"><b>시험종류</b></label>
                     <input style="width:100px;height:25px;"type="text" v-model="category">
                </span>
            </div>
            <span class="text"style="padding: 20px 20px 20px 20px">
                <label style="padding-right:20px;font-size:1.3em" for="male"><b>파일</b></label>
                <input style="width:275px"type="file" ref="file" v-on:change="handleFileUpload">
            </span>
            <span class="text">
                     <label style="padding-right:20px;padding-left:20px;font-size:1.3em"for="male"><b>대학</b></label>
                     <input style="width:275px;padding-left:10px;height:25px;"type="text" v-model="university">
            </span>
        </div>
        <br/>
        <div style="text-align:center">
            <div>
                <textarea style="height:300px; width:700px; background:white" v-model="explain">코멘트를 작성하세</textarea>
            </div>
        </div>
        <br/>
        <div style="text-align:center">
            <button style="font-size:17px;background:#6A4CFF;border-color:#bababa;width:140px;height:40px;border-radius:13px;color:white;" @click="createJockbo"><b>제출하기</b></button>
            <span style="padding-left:20px;"><button style="font-size:17px;background:#ffffff;border-color:#c5c5c5;border-style:solid;width:140px;height:40px;border-radius:13px;color:#1d29da;" @click="createJockbo"><b>임시저장</b></button></span>
        </div>

        </div>
    </div>

</template>

<script>
export default {
    data() {
        return {
            subject: '',
            professor: '',
            year: '',
            semester: '',
            category: '',
            file: '',
            explain: '',
            university: this.$store.state.useruni
        }
    },
    methods: {
        handleFileUpload() {
            this.file = this.$refs.file.files[0];
        },
        createJockbo() {
            console.log(this.file)
            let bodyFormData = new FormData();
            bodyFormData.append('subject', this.subject);
            bodyFormData.append('professor', this.professor);
            bodyFormData.append('year', this.year);
            bodyFormData.append('semester', this.semester);
            bodyFormData.append('category', this.category);
            bodyFormData.append('university', this.university);
            bodyFormData.append('explain', this.explain);
            bodyFormData.append('file', this.file);


            console.log(this.$store.state.jwt)
            axios({
                method: 'post',
                url: '/api/post',
                data: bodyFormData,
                headers: {
                    authorization: this.$store.state.jwt,
                    'Content-Type': 'multipart/form-data'
                },
            }).then(
                (response) => {
                    console.log(response.data)
                    this.$router.push('/detail/' + response.data.id)
                }
            )


            // axios({
            //     method: 'post',
            //     url: 'http://127.0.0.1:8000/api/post',
            //     data: bodyFormData,
            //     config: { headers: {'Content-Type': 'multipart/form-data' }}
            //     })
            //     .then(function (response) {
            //         console.log(response.data);
            //     })
            //     .catch(function (response) {
            //         console.log(response);
            //     });
        }
    }
}
</script>

<style scoped>
    .text {
        color:#626262;
    }
    body {
        margin: 0;
        font-family: verdana, sans-serif;
        font-size: 0.85em;
    }
    textarea {
        border:solid 1px #b2b2b2;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;

    }
    input {
        background: white;
        border:solid 1px #b2b2b2;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 13px;
    }
    /*@media screen and (max-width: 1000px) {*/
    /*    input {*/
    /*        background: black;*/
    /*    }*/
    /*}*/

    #wrapper {
        padding-top:10px;
        width: 960px;
        margin: 0 auto;
        /*border-style:solid;*/

    }
</style>
