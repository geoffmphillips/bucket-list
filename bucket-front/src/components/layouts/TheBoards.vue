<template>
  <div>
    <div class="panel-container"
      fit-width="true" 
      item-selector=".item" 
      :origin-top="true" 
      :horizontal-order="false">
      <board-card
        class="item"
        v-for="(board, index) in boards"
          :key="index"
          :board="board"
          :post="posts[index]">
      </board-card>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import BoardCard from '../cards/BoardCard';

export default {
  components: {
    BoardCard
  },
  data() {
    return {
      boards: [],
      posts: [],
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/boards')
      .then((response) => {
        const { posts, boards } = response.data;
        this.boards = boards;
        this.posts = posts;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
