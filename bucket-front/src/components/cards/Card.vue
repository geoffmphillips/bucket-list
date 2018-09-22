<template>
<div id="users">
  <p>{{post.title}}</p>
  <img :src="post.photo_url" alt="">
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

</style>
