<template>
  <router-link class="panel" :to="'/boards/' + board.id">
    <h3 class="panel__text">{{ board.name }}</h3>
    <card-no-link :style="{ backgroundImage: 'url(' + post.photo_url + ')', backgroundSize: 'cover' }" :post='post'>
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

</style>
