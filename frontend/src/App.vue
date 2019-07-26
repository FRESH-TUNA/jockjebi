<template>
    <div>
        <Header/>
        <router-view/>
    </div>
</template>
<script>
    import Header from './components/header'
            
    export default {
        name: 'App',

        components: {
            Header
        },
    }
</script>
<style>
.application--wrap { min-height: 70px; }
</style>
