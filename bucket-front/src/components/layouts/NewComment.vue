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
      type: Object,
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
        console.log("POST: ", this.post)
        axios.post('http://localhost:3000/comments/new', {
          post_id: this.post.id,
          text: this.text,
        })
        .then((response) => {
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
