<template lang="pug">
  v-app
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
  data() {
    return {
    }
  }
}
</script>

<style lang="stylus">




</style>
