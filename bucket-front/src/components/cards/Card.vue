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
.panel {
  /* background-position: center;  */
  /* margin: 0 10px 20px; */
  /* border-radius: 0.75em; */
  /* width: 500px;
  height: 250px; */
}
.card {

}

</style>
