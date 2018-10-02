<template lang="pug">
  v-app(v-if="isSessionReady")
    navbar
    transition(
      name="slide"
      mode="in-out"
      )
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
.application--wrap
  margin-top: 70px

  body
    background #fcfcfc

  div.application
    width 90%
    margin 0 auto

    &--wrap

    .v-jumbotron
      padding 24px

      &__wrapper
        border-radius 3px

      .panel-container
        margin-top 50px


</style>
