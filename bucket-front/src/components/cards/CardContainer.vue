<template>
<div id="users">
  <div v-for="post in posts" :key="post.id">
    <p>{{ post.title }} is my {{ post.description }}</p>
  </div>
</div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      posts: [],
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/posts')
      .then((response) => {
        this.posts = response.data;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
