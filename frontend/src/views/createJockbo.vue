<template>
    <div>
        <label for="male">과목</label>
        <input type="text" v-model="subject">
        <label for="male">교수</label>
        <input type="text" v-model="professor">
        <label for="male">연도</label>
        <input type="text" v-model="year">
        <label for="male">학기</label>
        <input type="text" v-model="semester">
        <label for="male">분류</label>
        <input type="text" v-model="category">
        <label for="male">파일</label>
        <input type="file" ref="file" v-on:change="handleFileUpload">
        <label for="male">코멘트</label>
        <textarea v-model="explain"></textarea>
        <button @click="createJockbo">submit</button>
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

            axios({
                method: 'post',
                url: 'http://127.0.0.1:8000/api/post',
                data: bodyFormData,
                config: { headers: {'Content-Type': 'multipart/form-data' }}
                })
                .then(function (response) {
                    console.log(response.data);
                })
                .catch(function (response) {
                    console.log(response);
                });
        }
    }
}
</script>

<style scoped>

</style>
