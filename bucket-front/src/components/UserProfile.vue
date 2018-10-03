<template lang="pug">
  #profile
    h1.user-name {{ user.first_name }}
    hr
    
    .new-board
      h3 Add new board
      v-form(
        ref='newboard', 
        v-model='valid', 
        lazy-validation=''
      )
        v-text-field(
          v-model='board', 
          :rules='boardRules', 
          label='Board Name', 
          required=''
        )
        v-btn(
          :disabled='!valid', 
          @click='submit'
        ) submit
        v-btn(@click='clear') clear
    .board-section
      h1.section-text My Boards
      TheBoards.panel
    .post-section
      h1.section-text My Posts
      user-card-container(
        :posts='this.posts'
    )
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

    .user-name
      margin-top: 27px; margin-left: 27px
      font-weight: bold

    .section-text
      text-align: center
      font-weight: bold
      margin-top: 60px

    .new-board
      margin-left auto; margin-right auto; margin-top 28px
      padding 20px
      background white
      width: 450px
      box-shadow 4px 6px 16px -2px rgba(145,145,145,1);
      
      h3
        font-weight bold

      .v-input
        max-width 68%
    
    .board-section, .post-section
      padding 20px
      background white
      min-width: 1200px
      max-width: 1700px
      box-shadow 4px 6px 16px -2px rgba(145,145,145,1);
      margin-top 50px
      margin-left auto; margin-right auto

  a.panel
    margin 0 !important

</style>
