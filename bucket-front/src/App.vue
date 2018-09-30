<template lang="pug">
  v-app(v-if="isSessionReady")
    navbar
    router-view
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
import Vuetify from 'vuetify'
import Navbar from '@/components/Navbar'

export default {
  name: 'App',
  components: {
    Navbar,
  },
  mounted () {
    this.$store.dispatch('setupSession');
  },
  computed: {
    isSessionReady() {
      return this.$store.state.user.isSessionReady;
    }
  },
  data() {
    return {
    }
  }
}
</script>

<style lang="stylus">
body 
  background #fcfcfc

  div.application
    width 90%
    margin 0 auto

    &--wrap
      box-shadow -3px 3px 16px 1px rgba(66,66,66, 1)

    .v-jumbotron
      padding 24px
      box-shadow inset 0px 7px 13px -3px #42422F //I'm ok to take this one out. it is a bit unconventional.
 

      &__wrapper
        border-radius 3px



      .panel-container 
        margin-top 50px

</style>
