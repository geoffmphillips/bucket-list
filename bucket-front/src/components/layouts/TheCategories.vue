<template>
  <div class="categories-container">
    <category-card
      v-for="(category, index) in categories"
      :category="category"
      :post="posts[index]"
      :key="index"
    ></category-card>
  </div>
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
a {
  text-decoration: none;
  color: black;
  position: relative;
}
h3 {
  position: absolute;
  z-index: 2;
  color: white;
  font-size: 4em;
  width: max-content;
  top: 2em;
}
.category-container {
  display: flex;
  align-items: flex-start;
}
</style>
