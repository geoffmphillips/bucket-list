<template lang="pug">
  v-navigation-drawer.sidebar(
    v-model="isActive"
    fixed
    :mobile-break-point="1904"
    app
    touchless
    dark
    right
  )
    v-layout(justify-center wrap)
      .sidebar__hero-pattern

    v-divider

    v-list.sidebar__list(light)
      v-list-group(prepend-icon='person')
        v-list-tile(slot="activator" ripple)
          v-list-tile-content.sidebar__username
            v-list-tile-title Username
        v-list-tile(ripple :to="{ name: 'account' }")
          v-list-tile-action
            v-icon account_box
          v-list-tile-content
            v-list-tile-title Account
        v-list-tile(ripple :to="{ name: 'settings' }")
          v-list-tile-action
            v-icon settings
          v-list-tile-content
            v-list-tile-title Settings

    v-divider

    v-list(dark)
      v-list-tile(ripple :to="{ name: 'Boards' }")
        v-list-tile-action
          v-icon library_books
        v-list-tile-content
          v-list-tile-title My Boards

      v-list-tile(ripple :to="{ name: 'favourites' }")
        v-list-tile-action
          v-icon dashboard
        v-list-tile-content
          v-list-tile-title Favorites

      //- v-list-group(prepend-icon='build')
      //-   v-list-tile(slot="activator" ripple)
      //-     v-list-tile-content
      //-       v-list-tile-title Example
      //-   v-list-tile(ripple :to="{ name: 'budgetTool' }")
      //-     v-list-tile-content
      //-       v-list-tile-title Inner Example
      //-   v-list-tile(ripple :to="{ name: 'rateTool' }")
      //-     v-list-tile-content
      //-       v-list-tile-title Inner Example

      //- v-list-group(prepend-icon='assessment')
      //-   v-list-tile(slot="activator" ripple)
      //-     v-list-tile-content
      //-       v-list-tile-title Example
      //-   v-list-tile(ripple :to="{ name: 'laborReport' }")
      //-     v-list-tile-content
      //-       v-list-tile-title Inner Example
      //-   v-list-tile(ripple :to="{ name: 'earningsReport' }")
      //-     v-list-tile-content
      //-       v-list-tile-title Inner Example

      //- v-list-group(prepend-icon='web')
      //-   v-list-tile(slot="activator" ripple)
      //-     v-list-tile-content
      //-       v-list-tile-title Example
      //-   v-list-tile(ripple :to="{ name: 'wip' }")
      //-     v-list-tile-content
      //-       v-list-tile-title Inner Example

      //- v-list-group(prepend-icon='more_horiz')
      //-   v-list-tile(slot="activator" ripple)
      //-     v-list-tile-content
      //-       v-list-tile-title More
      //-   v-list-tile(ripple :to="{ name: 'importMyData' }")
      //-     v-list-tile-content
      //-       v-list-tile-title More Here

      v-list-tile(@click="logout()" ripple)
        v-list-tile-action
          v-icon exit_to_app
        v-list-tile-content
          v-list-tile-title Log out
</template>

<script>

import axios from 'axios';

  export default {
    name: 'AppSidebar',

    computed: {
      isActive: {
        get () {
          return this.$store.state.common.sidebar.visible
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
      }
    }

}
</script>

<style lang="stylus">
  .sidebar
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
