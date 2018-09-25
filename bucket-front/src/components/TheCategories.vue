<template>
  <div>
    <div class="category-container">
      <div class="header">
        <h3><strong>{{this.categories[0].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.category1Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="category-container">
      <div class="header">
        <h3><strong>{{this.categories[1].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.category2Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="category-container">
      <div class="header">
        <h3><strong>{{this.categories[2].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.category3Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="category-container">
      <div class="header">
        <h3><strong>{{this.categories[3].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.category4Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="category-container">
      <div class="header">
        <h3><strong>{{this.categories[4].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.category5Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="category-container">
      <div class="header">
        <h3><strong>{{this.categories[5].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.category6Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="category-container">
      <div class="header">
        <h3><strong>{{this.categories[6].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.category7Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Card from './cards/Card';
import CardContainer from './cards/CardContainer';

export default {
  components: {
    Card,
    CardContainer,
  },
  data() {
    return {
      categories: [],
      category1Posts: [],
      category2Posts: [],
      category3Posts: [],
      category4Posts: [],
      category5Posts: [],
      category6Posts: [],
      category7Posts: [],
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
        this.category1Posts = category1Posts;
        this.category2Posts = category2Posts;
        this.category3Posts = category3Posts;
        this.category4Posts = category4Posts;
        this.category5Posts = category5Posts;
        this.category6Posts = category6Posts;
        this.category7Posts = category7Posts;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
.category-container {
  display: flex;
  align-items: flex-start;
}
.posts-container {
  display: flex;
  flex-flow: row wrap;
  align-items: flex-start;
  flex-grow: 3;
}
.header {
  width: 400px;
}
</style>
