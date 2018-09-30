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

</style>
