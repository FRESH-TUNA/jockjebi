<template>
    <div class="jockboList">
        <div class="jockboList-header">
        </div>
        <div class="jockboList-body">
            <div class="left-nav-bar">
            </div>
            <div class="jockboBundle">
                <div class="jockbo" v-for="item in jockboList" key="item.year">
                    <h3 class="headline mb-0">{{item.year}}-{{item.semester}}</h3>
                    <h3 class="headline mb-0">{{item.subject}}</h3>
                    <h3 class="headline mb-0">{{item.professor}}</h3>
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
            axios({ method: "GET", "url": "http://127.0.0.1:8000/api/post" }).then(result => {
                this.jockboList = result.data;
            }, error => {
                console.error(error);
            });
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
    }
    .jockboList-header {
        margin-top: 20px;
        margin-left: auto;
        margin-right: auto;

        height: 50px;
        width: 500px;

        background-color: aqua;
    }
    .jockboList-body {
        padding-top: 10px;
        width: 800px;
        border: 1px solid black;

        display: flex;
        justify-content: space-between;
    }
    .left-nav-bar {
        display: inline-block;
        width: 200px;
        height: 500px;
        border: 1px solid black;
    }
    .jockboBundle {
        display: inline-block;
        width: 590px;
        height: 500px;
        overflow: scroll;
        background-color:antiquewhite;
    }
    .jockbo {
        width: 580px;
        height: 100px;
        margin-top: 5px; 
        border: 1px solid black;
    }

    @media screen and (max-width: 700px){
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
        }

        .jockboList-body {
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

