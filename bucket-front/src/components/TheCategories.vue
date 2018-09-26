<template>
  <div class="categories-container">
    <router-link :to="'/categories/' + this.categories[0].id" class="category-container">
      <h3><strong>{{this.categories[0].name}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.category1Posts[0].photo_url + ')' }"
      :post="this.category1Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/categories/' + this.categories[1].id" class="category-container">
      <h3><strong>{{this.categories[1].name}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.category2Posts[0].photo_url + ')' }"
      :post="this.category2Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/categories/' + this.categories[2].id" class="category-container">
      <h3><strong>{{this.categories[2].name}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.category3Posts[0].photo_url + ')' }"
      :post="this.category3Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/categories/' + this.categories[3].id" class="category-container">
      <h3><strong>{{this.categories[3].name}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.category4Posts[0].photo_url + ')' }"
      :post="this.category4Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/categories/' + this.categories[4].id" class="category-container">
      <h3><strong>{{this.categories[4].name}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.category5Posts[0].photo_url + ')' }"
      :post="this.category5Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/categories/' + this.categories[5].id" class="category-container">
      <h3><strong>{{this.categories[5].name}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.category6Posts[0].photo_url + ')' }"
      :post="this.category6Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/categories/' + this.categories[6].id" class="category-container">
      <h3><strong>{{this.categories[6].name}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.category7Posts[0].photo_url + ')' }"
      :post="this.category7Posts[0]"
      ></card-no-link>
    </router-link>
  </div>
</template>

<script>
import axios from 'axios';
import CardNoLink from './cards/CardNoLink';
import CardContainer from './cards/CardContainer';

export default {
  components: {
    CardNoLink,
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
        console.log(response)
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
