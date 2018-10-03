<template>
  <router-link :to="'/boards/' + board.id" class="card">
    <strong>{{board.name}} </strong>
  </router-link>
</template>

<script>
export default {
  props: {
    board: {
      type: Object,
    },
  },
};
</script>

<style scoped>
a {
  text-decoration: none;
  display: inline;
  color: black;
  border: 0;
}
</style>
