<template lang="pug">
  .categories-container
    router-link.category(:to="'/categories/' + this.categories[0].id")
      h3 {{this.categories[0].name}}
      card-no-link(:style="{ backgroundImage: 'url(' + this.category1Posts[0].photo_url + ')' }", :post='this.category1Posts[0]')

    router-link.category(:to="'/categories/' + this.categories[1].id")
      h3 {{this.categories[1].name}}
      card-no-link(:style="{ backgroundImage: 'url(' + this.category2Posts[0].photo_url + ')' }", :post='this.category2Posts[0]')

    router-link.category(:to="'/categories/' + this.categories[2].id")
      h3 {{this.categories[2].name}}
      card-no-link(:style="{ backgroundImage: 'url(' + this.category3Posts[0].photo_url + ')' }", :post='this.category3Posts[0]')

    router-link.category(:to="'/categories/' + this.categories[3].id")
      h3 {{this.categories[3].name}}
      card-no-link(:style="{ backgroundImage: 'url(' + this.category4Posts[0].photo_url + ')' }", :post='this.category4Posts[0]')

    router-link.category(:to="'/categories/' + this.categories[4].id")
      h3 {{this.categories[4].name}}
      card-no-link(:style="{ backgroundImage: 'url(' + this.category5Posts[0].photo_url + ')' }", :post='this.category5Posts[0]')

    router-link.category(:to="'/categories/' + this.categories[5].id")
      h3 {{this.categories[5].name}}
      card-no-link(:style="{ backgroundImage: 'url(' + this.category6Posts[0].photo_url + ')' }", :post='this.category6Posts[0]')
      
    router-link.category(:to="'/categories/' + this.categories[6].id")
      h3 {{this.categories[6].name}}
      card-no-link(:style="{ backgroundImage: 'url(' + this.category7Posts[0].photo_url + ')' }", :post='this.category7Posts[0]')

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

<style>
.categories-container {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  width: 100%;
}
.category {
  text-decoration: none;
  color: black;
  position: relative;
  background: rgb(255, 218, 218);
}
h3 {
  position: absolute;
  z-index: 2;
  color: white;
  font-size: 4em;
  width: max-content;
  top: 2em;
}
</style>
