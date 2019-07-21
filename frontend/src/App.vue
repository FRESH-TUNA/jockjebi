<template>
    <div>
        <NavbarLayout></NavbarLayout>
        <router-view/>
    </div>
</template>
<script>
    import NavbarLayout from './layouts/NavbarLayout'
            
    export default {
        name: 'App',

        components: {
            NavbarLayout
        },
    }

</script>
<style>
.application--wrap { min-height: 70px; }
</style>
