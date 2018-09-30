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
    h3 {{this.location.location}}
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
      location: [],
      errors: [],
    };
  },
  created() {
    axios.get(`http://localhost:3000/locations/${this.$route.params.id}`)
      .then((response) => {
        this.posts = response.data.posts;
        this.location = response.data.location;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
