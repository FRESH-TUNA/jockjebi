<template>
    <div>
        <v-toolbar
                dense
                color="#CDCAC9"
                dark
                extended
                extension-height="300"
                flat
        >
            <v-toolbar-title class="mx-auto" slot="extension">

                <h2 style="text-align:center">족보마켓</h2>
                <!-- <router-view class="view one"></router-view> -->

                <input type="text" class="form-control" placeholder="할일을 입력하세요">

                <div :class="{'searching--closed': !searching}" class="searching">
                    <v-text-field
                            id="search"
                            v-model="search"
                            append-icon="search"
                            @click:append="searchEnd"
                            label="Search"
                            hide-details
                            single-line
                            color="white"
                            @blur="onBlur"
                    ></v-text-field>
                </div>

            </v-toolbar-title>
        </v-toolbar>

        <router-link to="/hello">hello</router-link>

        <v-container>
            <v-layout row>
                <v-flex xs12 md8 offset-md2>
                    <v-card flat class="card--flex-toolbar" color="transparent">
                        <v-container fluid grid-list-lg>
                            <v-layout row wrap>
                                <v-flex xs12>
                                    <h2 class="white--text">Discover Vuebase</h2>
                                </v-flex>
                            </v-layout>
                            <v-layout row wrap>

                                <v-flex xs12 sm6 md6 lg4 v-for="item in dummy" :key="item.id">
                                    <v-hover>
                                        {{item.year}}
                                        <v-card slot-scope="{ hover }" :class="`elevation-${hover ? 12 : 2}`">
                                            <v-card-title primary-title>
                                                <div>
                                                    <h3 class="headline mb-0">{{item.year}}-{{item.semester}}</h3>
                                                    <h3 class="headline mb-0">{{item.subject}}</h3>
                                                    <h3 class="headline mb-0">{{item.professor}}</h3>
                                                    <div>
                                                        {{item.file}}
                                                    </div>
                                                </div>
                                            </v-card-title>
                                            <v-img
                                                    src=""
                                                    aspect-ratio="2.75"
                                                    height="125px"
                                                    :class="item.color"
                                            ></v-img>
                                            <v-card-actions>
                                                <v-btn flat color="primary" class="learn-more-btn">
                                                    Learn more
                                                </v-btn>
                                                <v-spacer></v-spacer>
                                                <v-btn flat color="primary">Get started</v-btn>
                                            </v-card-actions>
                                        </v-card>
                                    </v-hover>
                                </v-flex>
                            </v-layout>
                        </v-container>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                search: "",
                dummy: [],
                id: '1',
                subject: 'Dashboard',
                professor: 'Get detailed anlytics to measure and analyze how users engage with your app',
                year: 'orange',
                semester: '2019',
                category: '전필',
                file : 'aaaa.png',
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
                console.log(this.dummy);
            }, error => {
                console.error(error);
            });
        },

        methods: {
            sendData() {
                axios({ method: "POST", "url": "https://httpbin.org/post", "data": this.input, "headers": { "content-type": "application/json" } }).then(result => {
                    this.response = result.data;
                }, error => {
                    console.error(error);
                });
            },

            onBlur() {
                this.searching = false
                this.search = ''
            },

            searchBegin() {
                this.searching = true
                setTimeout(() => document.querySelector('#search').focus(), 50)
            },

            searchEnd() {
                this.searching = false
                this.search = ''
                document.querySelector('#search').blur()
                this.$router.push('/hello')
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
