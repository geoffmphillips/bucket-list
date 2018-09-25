<template>
<router-link :to="'/posts/' + post.id">
  <p>{{post.title}}</p>
  <div class="card">
  </div>
</router-link>
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
a:hover > p {
  opacity: 1;
}
div.card {
  margin: 0;
  width: 225px;
  height: 350px;
  border: 0px;
  opacity: 0;
}
p {
  z-index: 2;
  margin: 0px;
  color: white;
  opacity: 0;
}
</style>
