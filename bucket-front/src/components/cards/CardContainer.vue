<template>
<div id="users">
  <card
    v-for="post in posts"
    :key="post.id"
    :post="post"
  ></card>
</div>
</template>

<script>
import axios from 'axios';
import Card from './Card';

export default {
  components: {
    Card,
  },
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
