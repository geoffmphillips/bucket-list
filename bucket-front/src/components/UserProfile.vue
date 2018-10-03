<template>
  <div id="profile">
    <h1 class="welcome-back">Welcome back, {{ user.first_name }}!</h1>
    <div class="board-section">
      <h1 class="section-text">My Boards</h1>
      <TheBoards class="panel"></TheBoards>
    </div>
    <div class="post-section">
      <h1 class="section-text">My Posts</h1>
      <user-card-container
        :posts="this.posts"
      ></user-card-container>
    </div>
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

<style scoped lang="stylus">
  #profile 
    font-family: 'Avenir', Helvetica, Arial, sans-serif
    -webkit-font-smoothing: antialiased
    -moz-osx-font-smoothing: grayscale
    text-align: left
    color: #2c3e50
    margin-top: 20px

    .welcome-back
      margin-top: 27px; margin-left: 20px
      font-weight: bold

    .section-text
      text-align: center
      font-weight: bold
      margin-top: 60px   

    .panel > a
      margin 0    
      background red 
  

</style>
