<template>
  <div class="card">
    <p>{{category.name}}</p>
  </div>
</template>

<script>
export default {
  props: {
    category: {
      type: Object,
    },
  },
};
</script>

<style scoped>
div.card {
  background-color: #8BD6FD;
  border-radius: 1em;
  border: 0px;
}
</style>
