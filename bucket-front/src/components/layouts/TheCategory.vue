<template lang="pug">
  div
    h3.category-name {{this.category.name}}
    .panel-container(
      fit-width="true",
      percent-position: true,
      item-selector='.item',
      :origin-top="true",
      :horizontal-order="false",
    )
      card.item(
        v-for='post in posts',
        :key='post.id',
        :style="{ backgroundImage: 'url(' + post.photo_url + ')', backgroundSize: 'cover' }",
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
  div
    margin-top: 45px

    .category-name
      margin-top: 40px
      text-align: center
      font-weight: bold
      font-size: 3.4em

</style>
