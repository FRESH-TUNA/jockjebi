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
                <h2 style="color:#b0b0b0">족보.io</h2>
            </div>

<!--            <v-toolbar-side-icon-->
<!--                    @click.stop="drawer = !drawer"-->
<!--                    class="hidden-lg-and-up"-->
<!--                    :class="searching ? 'hidden-xs-only' : ''"-->
<!--            />-->
<!--            <v-menu :nudge-width="100" :class="searching ? 'hidden-xs-only' : ''">-->
<!--                <v-toolbar-title slot="activator" class="pl-2">-->
<!--                    <span>{{ menuItems[0] }}</span>-->
<!--                    <v-icon>arrow_drop_down</v-icon>-->
<!--                </v-toolbar-title>-->
<!--                <v-list light>-->
<!--                    <v-list-tile v-for="item in menuItems" :key="item" @click="">-->
<!--                        <v-list-tile-title v-text="item"></v-list-tile-title>-->
<!--                    </v-list-tile>-->
<!--                </v-list>-->
<!--            </v-menu>-->
            <v-spacer></v-spacer>

            <div style="padding-right:40px">
                <h2 style="color:#b0b0b0;font-size:15px">스크랩한 족보</h2>
            </div>

            <div style="padding-right:70px">
                <h2 style="color:#b0b0b0;font-size:15px">족보 업로드</h2>
            </div>

            <div style="  border-left: 1px solid #e5e5e5; height: 70px;"></div>
<!--            <v-btn icon @click.native.stop="searchBegin">-->
<!--                <v-icon>search</v-icon>-->
<!--            </v-btn>-->
<!--            <div :class="{'searching&#45;&#45;closed': !searching}" class="searching">-->
<!--                <v-text-field-->
<!--                        id="search"-->
<!--                        v-model="search"-->
<!--                        append-icon="close"-->
<!--                        @click:append="searchEnd"-->
<!--                        label="Search"-->
<!--                        hide-details-->
<!--                        single-line-->
<!--                        color="white"-->
<!--                        @blur="onBlur"-->
<!--                ></v-text-field>-->
<!--            </div>-->
            <div style="padding-left:20px;padding-right:40px">

                <v-tooltip bottom>
                    <v-btn icon @click.stop="rightDrawer = !rightDrawer" slot="activator">
                        <v-badge color="#b0b0b0" overlap>
                            <span slot="badge">5</span>
                            <v-icon  color="#b0b0b0">mail_outline
                            </v-icon>
                        </v-badge>
                    </v-btn>
                    <span>2 unread notifications</span>
                </v-tooltip>

                <v-tooltip bottom>
                    <v-btn icon @click.stop="rightDrawer = !rightDrawer" slot="activator">
                        <v-badge color="#b0b0b0" overlap>
                            <span slot="badge">2</span>
                            <v-icon  color="#b0b0b0">notifications_none</v-icon>
                        </v-badge>
                    </v-btn>
                    <span>2 unread notifications</span>
                </v-tooltip>

            </div>

            <div style="padding-right:20px">
                <v-menu>
                    <v-btn icon slot="activator">
                        <v-avatar class="white" size="32">
                            <h2 style="color:#b0b0b0;font-size:15px">졸린토끼▾</h2>
                        </v-avatar>
                    </v-btn>
                    <v-list class="pa-0" light>
                        <v-list-tile avatar>
                            <v-list-tile-avatar>
                                <v-avatar class="primary" size="48px">
                                    <v-icon dark>person</v-icon>
                                </v-avatar>
                            </v-list-tile-avatar>
                            <v-list-tile-content>
                                <v-list-tile-title>John Doe</v-list-tile-title>
                                <v-list-tile-sub-title>Administrator</v-list-tile-sub-title>
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

<!--        <v-navigation-drawer-->
<!--                temporary-->
<!--                :right="right"-->
<!--                v-model="rightDrawer"-->
<!--                fixed-->
<!--                app-->
<!--        >-->
<!--            <v-toolbar flat prominent dark class="primary">-->
<!--                <v-toolbar-title>Notifications</v-toolbar-title>-->
<!--                <v-spacer></v-spacer>-->
<!--                <v-btn icon @click.stop="rightDrawer = false">-->
<!--                    <v-icon>close</v-icon>-->
<!--                </v-btn>-->
<!--            </v-toolbar>-->
<!--            <v-list subheader dense>-->
<!--                <v-subheader>All notifications</v-subheader>-->
<!--                <v-list-tile @click="">-->
<!--                    <v-list-tile-action>-->
<!--                        <v-icon>person_add</v-icon>-->
<!--                    </v-list-tile-action>-->
<!--                    <v-list-tile-title>-->
<!--                        12 new users registered-->
<!--                    </v-list-tile-title>-->
<!--                </v-list-tile>-->
<!--                <v-divider></v-divider>-->
<!--                <v-list-tile @click="">-->
<!--                    <v-list-tile-action>-->
<!--                        <v-icon>data_usage</v-icon>-->
<!--                    </v-list-tile-action>-->
<!--                    <v-list-tile-title>-->
<!--                        DB overloaded 80%-->
<!--                    </v-list-tile-title>-->
<!--                </v-list-tile>-->
<!--            </v-list>-->
<!--        </v-navigation-drawer>-->
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
        margin-left:  auto; /* 1 */
        max-width: 960px; /* 2 */
        padding-right: 10px; /* 3 */
        padding-left:  10px; /* 3 */
    }
</style>
