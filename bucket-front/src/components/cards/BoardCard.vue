<template>
  <router-link class="panel" :to="'/boards/' + board.id">
    <p class="panel__text">{{ board.name }}</p>
    <card-no-link :style="{ backgroundImage: 'url(' + post.photo_url + ')' }" :post='post'>
    </card-no-link>
  </router-link>
</template>

<script>
import axios from 'axios';
import CardNoLink from './CardNoLink';

export default {
  props: {
    post: {},
    board: {},
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
