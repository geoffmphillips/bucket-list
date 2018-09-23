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
  display: flex;
  align-items: center;
  background-color: #8BD6FD;
  border-radius: 1em;
  border: 0px;
}
p {
  margin: 0.5em
}
</style>
