<template>
  <form @submit.prevent="submit">
    <div class="form-group">
      <textarea v-model="text" class="form-control" placeholder="Say something" rows="3"/>
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
    }
  },
  data() {
    return {
      text: "",
      errors: [],
    }
  },
  methods: {
    newComment() {
      this.$emit('newComment');
    },
    submit(event) {
      if(this.text !== '') {
        axios.post('http://localhost:3000/comments', {
          post_id: this.post.id,
          text: this.text,
        })
        .then((response) => {
          this.text = '';
          newComment();
        })
        .catch((error) => {
          this.errors.push(error);
        })
      }
    },
  },
};
</script>

<style scoped>
form {
  display: flex;
  width: 500px;
}
textarea {
  width: 425px;
}
button {
  height: 75px;
}
</style>
