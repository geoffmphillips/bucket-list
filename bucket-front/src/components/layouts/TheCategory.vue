<template lang="pug">
  .panel-container
    h3 {{this.category.name}}
    card(
      v-for='post in posts', 
      :key='post.id', 
      :style="{ backgroundImage: 'url(' + post.photo_url + ')' }", 
      :post='post'
      )

</template>

<script>
import axios from 'axios';
import Card from '../cards/Card';

export default {
  components: {
    Card,
  },
  data() {
    return {
      posts: [],
      category: [],
      errors: [],
    };
  },
  created() {
    axios.get(`http://localhost:3000/categories/${this.$route.params.id}`)
      .then((response) => {
        this.posts = response.data.posts;
        this.category = response.data.category;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
