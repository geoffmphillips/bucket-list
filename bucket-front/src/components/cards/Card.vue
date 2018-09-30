<template lang="pug">
  router-link.panel(:to="'/posts/' + post.id")
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
