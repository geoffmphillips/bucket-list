<template>
<router-link :to="'/categories/' + category.id" class="category-container">
  <h3><strong>{{category.name}}</strong></h3>
  <card-no-link
  :style="{ backgroundImage: 'url(' + post[0].photo_url + ')' }"
  :post="post[0]"
  ></card-no-link>
</router-link>
</template>

<script>
import axios from 'axios';
import CardNoLink from './CardNoLink';

export default {
  props: {
    post: {
      type: Array,
    },
    category: {
      type: Object,
    }
  },
  components: {
    CardNoLink,
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
