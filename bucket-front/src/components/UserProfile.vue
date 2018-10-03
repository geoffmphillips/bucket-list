<template>
<div id="profile">
  <h1>Hi, {{ user.first_name }}!</h1>
  <h1>Your boards</h1>
  <h3> Create a new board:</h3><br>
  <v-form ref="newboard" v-model="valid" lazy-validation>
   <v-text-field
     v-model="board"
     :rules="boardRules"
     :counter="5"
     label="Board Name"
     required
   ></v-text-field>
   <v-btn
     :disabled="!valid"
     @click="submit"
   >
     submit
   </v-btn>
   <v-btn @click="clear">clear</v-btn>
 </v-form>
  <the-boards></the-boards>
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
