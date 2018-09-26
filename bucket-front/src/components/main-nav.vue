<template>
<div id="mainNav" >
    <router-link to="/">Home</router-link>
    <router-link to="/login" v-if="!isLoggedIn">Login</router-link>
    <a href="#" v-if="isLoggedIn" @click="logout">Logout</a>
</div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'mainNav',
  methods: {
    logout() {
      this.$store.dispatch('logout');
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters.isLoggedIn;
    }
  }
};
</script>

<style scoped>
</style>
