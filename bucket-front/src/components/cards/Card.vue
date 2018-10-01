<template>
  <router-link class="panel" :to="'/posts/' + post.id"></router-link>
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
