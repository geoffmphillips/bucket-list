<template lang="pug">
  router-link.location-container.panel(
    :to="'/locations/' + location.id"
    )
    p.panel__text {{location.location}}
    card-no-link(
      :style="{ backgroundImage: 'url(' + post[0].photo_url + ')' }",
      :post='post[0]'
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
p {
  z-index: 2;
}
</style>
