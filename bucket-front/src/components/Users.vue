<template>
<div id="users">
  <div v-for="user in users" :key="user.id">
    <p>{{ user.first_name }} is my {{ user.email }}</p>
  </div>
</div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      users: [],
      first_name: [],
      email: [],
      errors: [],
    };
  },
  created() {
    axios.get('localhost:3000/users')
      .then((response) => {
        this.users = response.data;
      })
      .catch((e) => {
        this.error.push(e);
      });
  },
};
</script>

<style scoped>

</style>
