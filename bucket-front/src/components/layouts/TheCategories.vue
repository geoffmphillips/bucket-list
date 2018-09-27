<template lang="pug">
  .categories-container.panel-container
    category-card(
      v-for='(category, index) in categories', 
      :category='category', 
      :post='posts[index]', 
      :key='index'
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
        const { categories,
          category1Posts,
          category2Posts,
          category3Posts,
          category4Posts,
          category5Posts,
          category6Posts,
          category7Posts } = response.data;
        this.categories = categories;
        this.posts = [category1Posts,
                       category2Posts,
                       category3Posts,
                       category4Posts,
                       category5Posts,
                       category6Posts,
                       category7Posts,]
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
