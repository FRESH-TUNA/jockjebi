<template>
    <div class="jockboList">
        <div class="jockboList-header">
        </div>
        <div class="status-header">
            <div class="status-header-item search-field-label">검색필터</div>
            <div class="status-header-item">29개의 족보가 있네요!</div>
        </div>
        <div class="jockboList-body">
            <div class="left-nav-bar">
                <div class="left-nav-bar-item">
                </div>
                <div class="left-nav-bar-item">
                </div>
                <div class="left-nav-bar-item">
                </div>
                <div class="left-nav-bar-item">
                </div>
                <div class="left-nav-bar-item">
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
    export default {
        data() {
            return {
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
    .jockboList {
        display: flex;
        flex-flow: column;
        justify-content: center;
        align-items: center;
        background-color: rgb(200, 200, 200);

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
        width: 800px;

        display: flex;
        justify-content: space-between;
    }
    .left-nav-bar {
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

    @media screen and (max-width: 750px){
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

