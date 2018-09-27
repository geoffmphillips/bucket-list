<template lang="pug">
  router-link.location-container.panel(
    :to="'/locations/' + location.id"
    )
    h3.panel__text {{location.location}}
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
a {
  /* text-decoration: none;
  color: black;
  position: relative; */
}
h3 {
  /* position: absolute;
  z-index: 2;
  color: white;
  font-size: 4em;
  width: max-content;
  top: 2em; */
}
.location-container {
  /* display: flex;
  align-items: flex-start; */
}
</style>
