<template lang="pug">
  v-app(v-if="isSessionReady")
    sidebar
    navbar
    jumbotron
    router-view
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
import Vuetify from 'vuetify'
import Navbar from '@/components/Navbar'
import Jumbotron from '@/components/Jumbotron'
import Sidebar from '@/components/Sidebar'

export default {
  name: 'App',
  components: {
    Navbar,
    Jumbotron,
    Sidebar,
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

</style>
