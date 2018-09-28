<template lang="pug">
  .panel-container(
    v-masonry='', 
    fit-width="true",
    transition-duration="0.4s", 
    percent-position: true,
    item-selector='.item',
    :origin-top="true",
    :horizontal-order="false",
  )
    h3 {{this.category.name}}
    card.item(
      v-masonry-tile='',
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

<style scoped lang="stylus">
  .panel-container !important
    width: 500px
    height: 250px
</style>
