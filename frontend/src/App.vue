<template>
    <vue-base-layout></vue-base-layout>
    <!-- <component :is="component">
        <slot/>
    </component> -->
    <!-- <router-view></router-view> -->
</template>
<script>
    import vueBaseLayout from './layouts/VuebaseLayout'

    export default {
        name: 'App',

        components: {
            vueBaseLayout
        },

        // computed: {
        //     component() {
        //         return VuebaseLayout
        //     }
        // }
    }
</script>
