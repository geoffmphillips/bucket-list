<template>
<div id="profile">
  <h1>Hi, {{ user.first_name }}!</h1>
  <h1>Your boards</h1>
  <TheBoards></TheBoards>
  <h1>Your posts</h1>
  <user-card-container
    :posts="this.posts"
  ></user-card-container>
</div>
</template>

<script>
import axios from 'axios';
import TheBoards from './layouts/TheBoards';
import UserCardContainer from './cards/UserCardContainer';

export default {
  components: {
    TheBoards,
    UserCardContainer,
  },
  data() {
    return {
      user: {},
      posts: [],
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/users/1')
      .then((response) => {
        const { user, posts } = response.data
        this.user = user;
        this.posts = posts;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },


};

</script>

<style scoped>
#profile {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
  margin-top: 20px;
}
</style>
