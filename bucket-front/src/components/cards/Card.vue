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

</style>
