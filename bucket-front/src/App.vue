<!-- //- <template lang="pug"> -->
<template lang="pug" v-if="!loggedin">
  #app
    navbar
    jumbotron

    router-view
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
import Vuetify from 'vuetify'
import Navbar from './components/Navbar'
import Jumbotron from './components/Jumbotron'

export default {
  name: 'App',
  components: {
    Navbar,
    Jumbotron,
  },
  data() {
    return {
    }
  }
}
</script>

<style lang="stylus">




</style>
