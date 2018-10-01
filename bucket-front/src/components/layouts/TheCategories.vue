<template lang="pug">
  .panel-container(
    fit-width="true",
    item-selector='.item',
    :origin-top="true",
    :horizontal-order="false",
  )
    category-card.item(
      v-for='(category, index) in categories',
      :key='index',
      :category='category',
      :post='posts[index]',
    )
</template>

<script>
import axios from 'axios';
import CategoryCard from '../cards/CategoryCard';

export default {
  components: {
    CategoryCard,
  },
  data() {
    return {
      categories: [],
      posts: [],
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/categories')
    .then((response) => {
      const { categories, categoryPosts } = response.data;
      this.categories = categories;
      this.posts = categoryPosts
    })
    .catch((e) => {
      this.errors.push(e);
    });
  }
};
</script>

<style scoped lang="stylus">
</style>
