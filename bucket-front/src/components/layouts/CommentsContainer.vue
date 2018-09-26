<template>
<div class="card" style="width: 18rem;">
  <ul class="list-group list-group-flush">
    <comment
      v-for="comment in comments"
      :key="comment.id"
      :comment="comment"
    ></comment>
  </ul>
</div>
</template>

<script>
import axios from 'axios';

export default {
  components: {
    Comment
  },
  data() {
    return {

      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/posts')
      .then((response) => {
        this.posts = response.data.posts;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
#card-container {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-items: flex-start;
}
</style>
