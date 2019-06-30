<template>
    <NavbarLayout></NavbarLayout>
    <!-- <component :is="component">
        <slot/>
    </component> -->
    <!-- <router-view></router-view> -->
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
