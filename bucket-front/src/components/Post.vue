<template>
<div class="post-container">
  <div class="card">
    <p>{{this.post.title}}</p>
    <img :src="this.post.photo_url" :alt="this.post.note">
    <div class="categories-container">
      <category
        v-for="category in categories"
        :key="category.id"
        :category="category"
      ></category>
    </div>
    <p>{{this.post.note}}</p>
  </div>
</div>
</template>

<script>
import axios from 'axios';
import Category from './Category';

export default {
  name: 'Post',
  components: {
    Category,
  },
  data() {
    return {
      post: [],
      categories: [],
      errors: [],
    };
  },
  created() {
    axios.get(`http://localhost:3000/posts/${this.$route.params.id}`, {
      params: {
        id: 1,
      },
    })
      .then((response) => {
        this.post = response.data;
        this.categories = this.post.categories;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
div.card {
  width: max-content;
  height: auto;
  border-radius: 0.75em;
}
div.categories-container {
  display:flex;
  justify-content: center;
}

</style>
