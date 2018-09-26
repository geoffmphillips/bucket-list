<template lang="pug">

  router-link.panel(:to="'/posts/' + post.id")
    p.panel__text {{post.title}}
    .card

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
  z-index: 1;
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
p {
  z-index: 2;
  margin: 0px;
  color: black;
}
</style>
