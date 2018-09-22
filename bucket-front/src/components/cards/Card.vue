<template>
<a :href="'#/post/' + post.id">
  <div class="card">
    <p>{{post.title}}</p>
  </div>
</a>
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
}
div.card {
  width: 225px;
  height: 350px;

  border: 0px;
  opacity: 0;
}

</style>
