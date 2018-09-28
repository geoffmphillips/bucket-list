<template>
    <li class="list-group-item">
      <p><strong>{{this.user.first_name}} {{this.user.last_name}}</strong></p>
      <br>
      <p>{{comment.text}}</p>
    </li>
</template>

<script>
export default {
  name: 'CommentCard',
  props: {
    comment: {
      type: Object,
    },
  },
  data() {
    return {
      user: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/comments/' + this.comment.id)
      .then((response) => {
        this.user = response.data.user;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>

</style>
