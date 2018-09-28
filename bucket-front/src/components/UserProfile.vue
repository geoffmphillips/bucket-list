<template>
<div id="profile">
  <h1>{{ user.first_name }} {{ user.last_name }}</h1>

</div>
</template>

<script>
import axios from 'axios';

export default {
  computed: {
    user () {
      return this.$store.state.authentication.user;
    },
  },
};

</script>

<style scoped>
#profile {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
  margin-top: 20px;
}
</style>
