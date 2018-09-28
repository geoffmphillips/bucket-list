<template lang="pug">
  .panel-container(
    v-masonry='', 
    transition-duration='0.4s', 
    item-selector='.item',
    :origin-top="true",
    :horizontal-order="false",
  )
    card.item(
      v-masonry-tile='',
      v-for='(post, index) in posts', 
      :key='post.id', 
      :style="{ backgroundImage: 'url(' + post.photo_url + ')' }", 
      :post='post',
      stagger="300"
    )
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

</style>
