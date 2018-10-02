<template lang="pug">
  router-link.panel(:to="'/categories/' + category.id")
    p.panel__text {{category.name}}
    card-no-link(:style="{ backgroundImage: 'url(' + post.photo_url + ')', backgroundSize: 'cover' }", :post='post')
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
p {
  z-index: 2;
}
</style>
