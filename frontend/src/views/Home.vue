<template>
    <div>
        <div style="height:800px;text-align:center;">

        <!--background-image: URL();background-size: cover">-->


            <div style="font-size:3em;padding-top:80px">클릭 한 번으로!</div>
            <div style="font-size:3em;padding-bottom:20px">쉽고 빠르게 시험 대비하기</div>
            <div style="border-radius: 0.5em;box-shadow: 0 10px 5px #c2bfbe;background-color:white;height:200px; width:500px;display: inline-block;">
                <div class="input-field">
                    <span>
                    &#128269;
                    </span>
                    <!-- <v-text-field
                            id="search"
                            v-model="subject"
                            append-icon="close"
                            @click:append="searchEnd"
                            label="search"
                            hide-details
                            single-line
                            color="white"
                            @blur="onBlur"
                    ></v-text-field> -->
                    <input type="text" v-model="subject">
                    <v-btn icon @click.native.stop="searchBegin">
                    <v-icon>search</v-icon>
                    </v-btn>
                    <div :class="{'searching--closed': !searching}" class="searching">
                </div>
            </div>
            </div>
        </div>
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
        padding-top: 50px;
        display: inline-block;
        width: 400px;
    }
</style>
