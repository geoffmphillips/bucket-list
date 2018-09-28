<template lang="pug">
  v-app(v-if="isSessionReady")
    sidebar
    navbar
    jumbotron
    div(v-if='alert.message', :class='`alert ${alert.type}`') {{alert.message}}
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
    },
    alert() {
      return this.$store.state.alert;
    }
  },
  watch:{
    $route (to, from){
      // clear alert on location change
      this.$store.dispatch('alert/clear');
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
