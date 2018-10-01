<template>
<div id="profile">
  <h1>User Profile - {{ user.first_name }}</h1>
  <h1>Your boards</h1>
  <TheBoards></TheBoards>
</div>
</template>

<script>
import axios from 'axios';
import TheBoards from './layouts/TheBoards';

export default {
  components: {
    TheBoards,
  },
  data() {
    return {
      user: {
      },
      errors: [],
    };
  },
  // computed: {
  //   user () {
  //     return this.$store.state.user;
  //   },
  // },
  created() {
    axios.get('http://localhost:3000/users/1')
      .then((response) => {
        this.user = response.data;
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
