<template>
  <router-link :to="'/boards/' + board.id" class="card">
    <button class="btn btn-outline-primary">{{board.name}}</button>
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
button {
  margin: 5px;
}
</style>
