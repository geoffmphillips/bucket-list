<template lang="pug">
  router-link.location-container.panel(
    :to="'/locations/' + location.id"
  )
    h3.panel__text {{location.location}}
    card-no-link(
      :style="{ backgroundImage: 'url(' + post.photo_url + ')', backgroundSize: 'cover' }",
      :post='post'
    )

</template>

<script>
import axios from 'axios';
import CardNoLink from './CardNoLink';

export default {
  props: {
    post: {
      type: Array,
    },
    location: {
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
