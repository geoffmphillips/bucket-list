<template lang="pug">
  #profile
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
    hr
    .board-section
      h1.section-text My Boards
      TheBoards.panel
    hr
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
      valid: true,
      board: '',
      boardRules: [
        v => !!v || ' Board Name is required',
        v => (v && v.length >= 5) || 'Board Name must be more than 5 characters'
      ],
      user: {},
      posts: [],
      errors: [],
    };
  },

  created() {
    this.checkSignedIn();
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

  methods: {
    checkSignedIn() {
      if (!this.$store.state.user.isLoggedIn) {
        this.$router.replace('/login');
      }
    },
    submit() {
      if (this.$refs.newboard.validate()) {
        axios.post('http://localhost:3000/boards/', {
          name: this.board,
          user_id: this.user.id,
        }).then(response => {
          this.board = '';
          this.$router.replace({ path: '/profile' });
        }).catch(error => {

        });
      }
    },
    clear() {
      this.$refs.newboard.reset()
    }
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
    // margin-top: 20px
    margin 0 auto 
    background white
    max-width: 80vw

    .user-name
      margin-top: 27px; margin-left: 27px
      font-weight: bold

    .section-text
      font-weight: bold

    .new-board
      margin-left auto; margin-right auto; margin-top 51px; margin-bottom 51px
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

      h1
        margin-left initial

      .panel
  
        .panel-container
          justify-content left !important
          background red
        
</style>
