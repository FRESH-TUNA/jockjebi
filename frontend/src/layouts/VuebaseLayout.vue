<template>
    <v-app>
        <div class="wrapper">

            <v-toolbar
                    app
                    flat
                    dense
                    color="white"
                    style="opacity: 0.80;"
                    dark
                    height="70"
                    width="960"
            >
                <v-spacer></v-spacer>
                <div class="v-toolbar-title">
                    <router-link to="/"><h2 style="color:#d8d8d8;text-decoration:none">족보.io</h2></router-link>
                </div>
                <v-spacer></v-spacer>

                <div style="padding-right:40px">
                    <router-link to="/jockbolist"><h2 style="color:#7d7d7d;font-size:15px"><b>스크랩한 족보</b></h2></router-link>
                </div>

                <div style="padding-right:70px">
                    <router-link to="/createjockbo"><h2 style="color:#7d7d7d;font-size:15px"><b>족보 업로드</b></h2></router-link>
                </div>
                <div style="  border-left: 1px solid #e5e5e5; height: 70px;"></div>
                <div style="padding-left:20px;padding-right:40px">

                    <v-tooltip bottom>
                        <v-btn icon @click.stop="rightDrawer = !rightDrawer" slot="activator">
                            <v-badge color="#FDC335" overlap>
                                <span slot="badge">5</span>
                                <v-icon color="#b0b0b0">mail_outline
                                </v-icon>
                            </v-badge>
                        </v-btn>
                        <span>2 unread notifications</span>
                    </v-tooltip>

                    <v-tooltip bottom>
                        <v-btn icon @click.stop="rightDrawer = !rightDrawer" slot="activator">
                            <v-badge color="#FDC335" overlap>
                                <span slot="badge">2</span>
                                <v-icon color="#b0b0b0">notifications_none</v-icon>
                            </v-badge>
                        </v-btn>
                        <span>2 unread notifications</span>
                    </v-tooltip>

                </div>

                <div style="padding-right:20px">
                    <v-menu offset-y>
                        <v-btn icon slot="activator">
                            <v-avatar class="white" size="32">
                                <h2 style="color:#796ef6;font-size:15px">졸린토끼▾</h2>
                            </v-avatar>
                        </v-btn>
                        <v-list class="pa-0" light>
                            <v-list-tile avatar>
                                <v-list-tile-avatar>
                                    <v-avatar class="deep-purple accent-2" size="48px">
                                        <v-icon dark>sentiment_satisfied_alt</v-icon>
                                    </v-avatar>
                                </v-list-tile-avatar>
                                <v-list-tile-content>
                                    <v-list-tile-title>졸린토끼</v-list-tile-title>
                                    <v-list-tile-sub-title>숙명여자대학교</v-list-tile-sub-title>
                                </v-list-tile-content>
                            </v-list-tile>
                            <v-divider></v-divider>
                            <v-list-tile key="profile" @click="">
                                <v-list-tile-action>
                                    <v-icon>person</v-icon>
                                </v-list-tile-action>
                                <v-list-tile-content>
                                    <v-list-tile-title>My Profile</v-list-tile-title>
                                </v-list-tile-content>
                            </v-list-tile>
                            <v-divider></v-divider>
                            <v-list-tile key="lock_open" @click="">
                                <v-list-tile-action>
                                    <v-icon>lock_open</v-icon>
                                </v-list-tile-action>
                                <v-list-tile-content>
                                    <v-list-tile-title>Logout</v-list-tile-title>
                                </v-list-tile-content>
                            </v-list-tile>
                        </v-list>
                    </v-menu>
                </div>
                <v-spacer></v-spacer>
            </v-toolbar>
        </div>
        <v-content>
            <router-view/>
        </v-content>
    </v-app>
</template>

<script>
    export default {
        name: 'VuebaseLayout',

        data() {
            return {
                appName: process.env.VUE_APP_APP_NAME,
                drawer: true,
                fixed: false,
                analyticsItems: [
                    {
                        icon: 'dashboard',
                        title: 'Dashboard',
                        link: '/dashboard/indicators'
                    },
                    {
                        icon: 'event',
                        title: 'Events',
                        link: ''
                    },
                    {
                        icon: 'comment',
                        title: 'Notifications',
                        link: ''
                    }
                ],
                developItems: [
                    {
                        icon: 'supervisor_account',
                        title: 'Authentification',
                        link: ''
                    },
                    {
                        icon: 'storage',
                        title: 'Database',
                        link: ''
                    },
                    {
                        icon: 'perm_media',
                        title: 'Storage',
                        link: ''
                    },
                    {
                        icon: 'public',
                        title: 'Hosting',
                        link: ''
                    },
                    {
                        icon: 'functions',
                        title: 'Functions',
                        link: ''
                    }
                ],
                miniVariant: false,
                right: true,
                rightDrawer: false,
                tabs: null,
                tabsItems: [
                    {
                        id: 1,
                        title: 'Indicators',
                        link: 'indicators'
                    },
                    {
                        id: 2,
                        title: 'Backup',
                        link: 'backup'
                    },
                    {
                        id: 3,
                        title: 'Logs',
                        link: 'logs'
                    }
                ],
                menuItems: ['Vue', 'NodeJS', 'Laravel'],
                searching: false,
                search: ''
            }
        },

        methods: {
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
            }
        }
    }
</script>

<style scoped lang="stylus">
    @import '../../node_modules/vuetify/src/stylus/settings/_variables.styl';
    a {  text-decoration: none;}

    .bottom-menu {
        position: absolute;
        width: 100%;
        bottom: 0;
    }

    .searching {
        overflow: hidden;
        width: 208px;
        padding-left: 8px;
        transition: $primary-transition;
    }

    .searching--closed {
        padding-left: 0;
        width: 0;
    }

    .searching > * {
        right: 8px;
    }

    .searching--closed > * {
        display: none;
    }

    .hidden-searching {
        @media $display-breakpoints.sm-and-down {
            display: none !important;
        }
    }

    .list-border-bottom {
        border-bottom: 1px solid rgba(255, 255, 255, 0.12);
    }

    .wrapper {
        margin-right: auto; /* 1 */
        margin-left: auto; /* 1 */
        max-width: 960px; /* 2 */
        padding-right: 10px; /* 3 */
        padding-left: 10px; /* 3 */
    }
</style>
