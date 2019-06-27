<template>
    <div>
        <div style="height:800px;text-align:center;background-image: URL(http://ww1.sinaimg.cn/large/006tNc79gy1g4fvgimorbj30qo0f8jta.jpg);background-size: cover">
            <div style="font-size:3em;padding-top:80px">클릭 한 번으로!</div>
            <div style="font-size:3em;padding-bottom:20px">쉽고 빠르게 시험 대비하기</div>
            <div style="border-radius: 0.5em;box-shadow: 0 10px 5px #c2bfbe;background-color:white;height:200px; width:500px;display: inline-block;"></div>
        </div>

        <button @click="searchJockbo">searchTest</button>

    </div>
</template>

<script>
    export default {
        data() {
            return {
                subject: '',
                dummy: [],

                links: [
                    {
                        id: '1',
                        subject: 'Dashboard',
                        professor: 'Get detailed anlytics to measure and analyze how users engage with your app',
                        year: 'orange',
                        semester: '2019',
                        category: '전필',
                        file : 'aaaa.png',
                    },
                    {
                        id: '1',
                        subject: 'Dashboard',
                        professor: 'Get detailed anlytics to measure and analyze how users engage with your app',
                        year: 'orange',
                        semester: '2019',
                        category: '전필',
                        file : 'aaaa.png',
                    },
                    {
                        id: '1',
                        subject: 'Dashboard',
                        professor: 'Get detailed anlytics to measure and analyze how users engage with your app',
                        year: 'orange',
                        semester: '2019',
                        category: '전필',
                        file : 'aaaa.png',
                    },
                    {
                        id: '1',
                        subject: '데이터통신',
                        professor: '이영석',
                        year: '2019',
                        semester: '1학기',
                        category: '전필',
                        file : 'aaaa.png',
                    },

                ]
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
            searchJockbo() {
                axios({ method: "GET", "url": "http://127.0.0.1:8000/api/post?university=1&subject=수학"}).then(result => {
                    this.$store.state.jockboList = result.data;
                    console.log(this.$store.state.jockboList)
                    this.$router.push('/jockbolist')
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
</style>
