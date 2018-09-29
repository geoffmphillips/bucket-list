<template>
  <v-navigation-drawer class="sidebar" v-model="isActive" fixed="fixed" :mobile-break-point="1904" app="app" touchless="touchless" dark="dark" right="right">
    <v-layout justify-center="justify-center" wrap="wrap">
      <div class="sidebar__hero-pattern"></div>
    </v-layout>
    <v-divider></v-divider>
    <v-list class="sidebar__list" light="light">
        <v-list-tile v-if="!this.loggedIn" slot="activator" ripple="ripple">
          <v-list-tile-content class="sidebar__username">
            <v-list-tile-title> Log in For more features </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      <v-list-group v-if="this.loggedIn" prepend-icon="person">
        <v-list-tile slot="activator" ripple="ripple">
          <v-list-tile-content class="sidebar__username">
            <v-list-tile-title>{{ user.first_name }}</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile ripple="ripple" :to="{ name: 'account' }">
          <v-list-tile-action>
            <v-icon>account_box</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Account</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile ripple="ripple" :to="{ name: 'settings' }">
          <v-list-tile-action>
            <v-icon>settings</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Settings</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list-group>
    </v-list>
    <v-divider></v-divider>
    <v-list-tile v-if="!this.loggedIn" ripple :to="{ name: 'Login' }">
      <v-list-tile-action>
        <v-icon>exit_to_app</v-icon>
      </v-list-tile-action>
      <v-list-tile-content>
        <v-list-tile-title>Log in</v-list-tile-title>
      </v-list-tile-content>
    </v-list-tile>
    <div v-if="this.loggedIn">
      <v-list dark="dark">
        <v-list-tile ripple="ripple" :to="{ name: 'Boards' }">
          <v-list-tile-action>
            <v-icon>library_books</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>My Boards</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile ripple="ripple" :to="{ name: 'favourites' }">
          <v-list-tile-action>
            <v-icon>dashboard</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Favorites</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile @click="logout()" ripple="ripple">
          <v-list-tile-action>
            <v-icon>exit_to_app</v-icon>
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Log out</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </div>
    
  </v-navigation-drawer>
</template>

<script>

import axios from 'axios';

  export default {
    name: 'AppSidebar',
    data() {
      return {
        loggedIn: true, //isLoggedIn(),
        user: {
        },
        errors: [],
      }
    },
    created() {
      if (localStorage.signedIn) {
        axios.get('http://localhost:3000/users/1')
          .then((response) => {
            this.user = response.data;
          })
          .catch((e) => {
            this.errors.push(e);
          });
      }
    },
    computed: {
      isLoggedIn () {
        return this.$store.getters.isLoggedIn;
      },
      isActive: {
        get () {
          return this.$store.state.common.sidebar.visible;
        },
        set (val) {
          this.$store.dispatch('common/updateSidebar', { visible: val })
        }
      }
    },
    methods: {
      logout () {
        this.$store.dispatch('logOut');
        this.$router.replace('/');
        this.user = {};
      }
    }

}
</script>

<style lang="stylus">
  .my-sidebar
    z-index: 8

    &__logo
      padding-right: 10px
      padding-top: 14px
      padding-bottom: 14px
      height: 60px

    &__hero-pattern
      height: 145px
      width: 300px
      position: absolute
      background-color: #30B887
      background-image: url("../assets/sidebar-pic.jpg")

    &__avatar
      margin-top: 15px
      margin-left: 15px
      
    &__list
      margin-top: 80px

    &__username
      font-size: 1.5em
</style>