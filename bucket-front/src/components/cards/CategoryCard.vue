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

</style>
