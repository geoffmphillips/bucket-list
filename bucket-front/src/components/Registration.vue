<template>
  <div class="login-wrapper border border-light">
    <form class="form-signin" @submit.prevent="register">
      <h2 class="form-signin-heading">Registration</h2>
      <label for="inputFirst_name" class="sr-only">First name</label>
      <input v-model="first_name"
        type="string"
        id="inputFirst_name"
        class="form-control"
        placeholder="First name"
        required autofocus>
      <label for="inputLast_name" class="sr-only">Last name</label>
      <input v-model="last_name"
        type="string"
        id="inputLast_name"
        class="form-control"
        placeholder="Last name"
        required autofocus>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input v-model="email"
        type="email"
        id="inputEmail"
        class="form-control"
        placeholder="Email address"
        required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input v-model="password"
        type="password"
        id="inputPassword"
        class="form-control"
        placeholder="Password" required>
      <label for="inputPassword" class="sr-only">Confirm password</label>
      <input v-model="password_confirmation"
        type="password"
        id="inputPassword"
        class="form-control"
        placeholder="Password" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Register',
  data() {
    return {
      user: {
        first_name: '',
        last_name: '',
        email: '',
        password: '',
        password_confirmation: '',
      },
      submitted: false,
      error: '',
    };
  },
  created() {
    this.checkSignedIn();
  },
  updated() {
    this.checkSignedIn();
  },
  methods: {
    register() {
      axios.post('http://localhost:3000/users', { register: { user: this.user } })
        .then(response => this.registrationSuccessful(response))
        .catch(error => this.registrationFailed(error));
    },
    registrationSuccessful(response) {
      this.$store.dispatch('logIn', response.data.jwt);
      this.error = '';
      this.$router.replace('/posts');
    },
    registrationFailed(error) {
      this.error = (error.response && error.response.data && error.response.data.error) || '';
      delete localStorage.jwt;
    },
    checkSignedIn() {
      if (localStorage.signedIn === true) {
        this.$router.replace('/posts');
      }
    },
  },
};
</script>

<style lang="css">
body {
  background: rgb(196, 189, 189);
}

.login-wrapper {
  background: #fff;
  width: 70%;
  margin: 12% auto;
}

.form-signin {
  max-width: 330px;
  padding: 10% 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
