<template lang="pug">
  a
    .card.panel

</template>

<script>
export default {
  props: {
    post: {
      type: Object,
    },
  },
};
</script>

<style scoped>
a {
  background-position: center;
  margin: 0 10px 20px;
  border-radius: 0.75em;
  text-decoration: none;
}
div.card {
  margin: 0;
  width: 500px;
  height: 250px;
  border: 0px;
  opacity: 0;
}
</style>
