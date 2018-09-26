<template>
    <li class="list-group-item">
      <p>{{this.user.first_name}}</p>
      <br>
      <p>{{comment.text}}</p>
    </li>
</template>

<script>
export default {
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
    axios.get('http://localhost:3000/' + comment.id)
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

</style>
