<template>
<div id="profile">
  <h1>{{ user.first_name }} {{ user.last_name }}</h1>

</div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      id: this.$route.params.id,
      user: {
      },
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/users/2', {
      responseType: 'json',
      params: {
        id: 2,
      },
    })
      .then((response) => {
        this.user = response.data;
      })
      .catch((e) => {
        this.errors.push(e);
      });
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
