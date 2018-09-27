<template>
  <form @submit.prevent="submit">
    <div class="form-group">
      <label for="new-commment">New comment</label>
      <textarea v-model="text" class="form-control" id="new-cmment" placeholder="Say something" rows="3"/>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  name: "NewComment",
  props: {
    post: {
      type: Array,
    },
  },
  data() {
    return {
      text: "",
      errors: [],
    }
  },
  methods: {
    submit(event) {
      if(this.text !== '') {
        axios.post('http://localhost:3000/comments', {
          post_id: this.post.id,
          text: this.text,
          user_id: 1,
        })
        .then((response) => {
          this.text = '';
          this.$router.push({ name: 'Post', params: { id: 1 }});
        })
        .catch((error) => {
          this.errors.push(error);
        })
      }
    },
  },
};
</script>

<style lang="css">
</style>
