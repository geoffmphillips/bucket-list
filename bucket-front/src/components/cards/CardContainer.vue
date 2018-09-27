<template lang="pug">
  .card-container.panel-container
    card(v-for='post in posts', 
    :key='post.id', 
    :style="{ backgroundImage: 'url(' + post.photo_url + ')' }", 
    :post='post')
</template>

<script>
import axios from 'axios';
import Card from './Card';

export default {
  components: {
    Card
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
        this.posts = response.data.posts;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped lang="stylus">
  #card-container
    // border: 10px solid grey
    // display: flex
    // flex-flow: row wrap
    // justify-content: center
    // align-items: flex-start
</style>
