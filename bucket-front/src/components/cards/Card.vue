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
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/users')
      .then((response) => {
        this.users = response.data;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
