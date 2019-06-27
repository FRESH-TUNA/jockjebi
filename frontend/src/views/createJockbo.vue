<template>
    <div id="wrapper">
        <div style="padding-up:50px;padding-left:110px">
            <div style="padding: 20px 20px 20px 20px"><span  style="font-size:1.5em"><b>족보 업로드</b></span><span style="padding-right:450px;"></span><span style="text-align:left;font-size:1.5em">업로드가 처음이세요?</span></div><br/>
            <div style="padding: 20px 20px 5px 20px">
                <span style="padding-right:40px">
                    <label style="padding-right:20px;font-size:1.5em"for="male">과목</label>
                    <input style="width:275px;height:25px;"type="text" v-model="subject">
                </span>
                <span>
                    <label style="padding-right:20px;font-size:1.5em"for="male">교수</label>
                    <input style="width:275px;height:25px;"type="text" v-model="professor">
                </span>
            </div>
            <div style="padding: 5px 20px 20px 20px">
                <span style="padding-right:20px;">
                     <label style="padding-right:20px;font-size:1.5em"for="male">연도</label>
                    <input style="width:100px;height:25px;"type="text" v-model="year">
                </span>
               <span style="padding-right:40px">
                    <label style="padding-right:20px;font-size:1.5em"for="male">학기</label>
                    <input style="width:100px;height:25px;"type="text" v-model="semester">
               </span>
                <span>
                     <label style="padding-right:20px;font-size:1.5em"for="male">분류</label>
                     <input style="width:100px;height:25px;"type="text" v-model="category">
                </span>
            </div>
            <div style="padding: 20px 20px 20px 20px">
                <label style="padding-right:20px;font-size:1.5em" for="male">파일</label>
                <input type="file" ref="file" v-on:change="handleFileUpload">
            </div>
        </div>
        <div style="text-align:center">
            <div>
                <textarea style="height:300px; width:700px; background:white" v-model="explain">코멘트를 작성하세</textarea>
            </div>
        </div>
        <br/>
        <div style="text-align:center">
            <button style="background:#e0e0e0;border-color:#bababa;width:200px;height:35px" @click="createJockbo">submit</button>
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
            explain: ''
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
            bodyFormData.append('university', 1);
            bodyFormData.append('explain', this.explain);
            bodyFormData.append('file', this.file);
            
            console.log(this.$store.state.jwt)
            axios({
                method: 'post',
                url: 'http://127.0.0.1:8000/api/post', 
                data: bodyFormData,
                headers: {
                    authorization: this.$store.state.jwt,
                    'Content-Type': 'multipart/form-data'
                },
            }).then((response) => {console.log(response.data)})


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
        border-radius: 5px;
    }
    @media screen and (max-width: 1000px) {
        input {
            background: black;
        }
    }

    #wrapper {
        width: 960px;
        margin: 0 auto;
        /*border-style:solid;*/
    }
</style>
