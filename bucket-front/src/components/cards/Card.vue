<template>
<div class="card">
  <div class="image-container">
    <p>{{post.title}}</p>
  </div>
</div>
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
div.card {
  border-radius: 0.75em;
  width: 300px;
  height: 600px;
  background-position: center;
  margin: 0 10px 20px
}

</style>
