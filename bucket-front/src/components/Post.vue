<template>
<div class="post-container">
  <div class="card">
    <p>{{this.post.title}}</p>
    <img :src="this.post.photo_url" :alt="this.post.note">
  </div>
</div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Post',
  data() {
    return {
      post: [],
      errors: [],
    };
  },
  created() {
    axios.get(`http://localhost:3000/posts/${this.$route.params.id}`, {
      params: {
        id: 1,
      },
    })
      .then((response) => {
        this.post = response.data;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
div.card {
  width: max-content;
  height: auto;
  border-radius: 0.75em;
}

</style>
