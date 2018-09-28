<template>
<div id="boards">
  <div>
    <h2>Boards</h2>
    <div v-for="board in boards" :key="board.id">
      <div>{{ board.name }}</div>
      <div></div>
    </div>
  </div>
</div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      boards: [],
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/boards')
      .then((response) => {
        this.boards = response.data;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
