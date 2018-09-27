<template lang="pug">
  router-link.panel(:to="'/categories/' + category.id")
    h3.panel__text {{category.name}}
    card-no-link(:style="{ backgroundImage: 'url(' + post[0].photo_url + ')' }", :post='post[0]')
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
.category-container {
  /* text-decoration: none;
  color: black;
  position: relative;
  display: flex;
  align-items: flex-start; */
}
h3 {
  /* position: absolute;
  z-index: 2;
  color: white;
  font-size: 4em;
  width: max-content;
  top: 2em; */
}

</style>
