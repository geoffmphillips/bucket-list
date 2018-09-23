<template>
  <div class="card">
    <p>{{comment.text}}</p>
  </div>
</template>

<script>
export default {
  props: {
    comment: {
      type: Object,
    },
  },
};
</script>

<style scoped>

</style>
