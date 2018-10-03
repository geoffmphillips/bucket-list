<template>
  <router-link :to="'/categories/' + category.id" class="card">
    <button class="btn btn-primary">{{category.name}}</button>
  </router-link>
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
a.card {
  text-decoration: none;
  display: flex;
  align-items: center;
  background-color: #8BD6FD;
  border-radius: 1em;
  border: 0px;
  color: black;
  margin: 5px 2.5px;
}
</style>
