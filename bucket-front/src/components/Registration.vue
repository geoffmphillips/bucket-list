<template>
  <div class="login-wrapper border border-light">
    <form class="form-signin" @submit.prevent="handleSubmit">
      <h2 class="form-signin-heading">Registration</h2>
      <div class="form-group">
        <label for="first_name" class="sr-only">First name</label>
        <input v-model="user.first_name"
          v-validate="'required'"
          type="text"
          name="first_name"
          class="form-control"
          :class="{ 'is-invalid': submitted && vErrors.has('first_name') }"
          placeholder="First name"
          autofocus />
          <div v-if="submitted && vErrors.has('first_name')" class="invalid-feedback">{{ vErrors.first('first_name') }}</div>
      </div>
      <div class="form-group">
        <label for="last_name" class="sr-only">Last name</label>
        <input v-model="user.last_name"
          v-validate="'required'"
          type="text"
          name="last_name"
          class="form-control"
          :class="{ 'is-invalid': submitted && vErrors.has('last_name') }"
          placeholder="Last name"
          autofocus />
          <div v-if="submitted && vErrors.has('last_name')" class="invalid-feedback">{{ vErrors.first('last_name') }}</div>
      </div>
      <div class="form-group">
        <label for="email" class="sr-only">Email address</label>
        <input v-model="user.email"
          v-validate="'required'"
          type="email"
          name="email"
          class="form-control"
          :class="{ 'is-invalid': submitted && vErrors.has('email') }"
          placeholder="Email address"
          autofocus />
      </div>
      <div class="form-group">
        <label for="password" class="sr-only">Password</label>
        <input v-model="user.password"
          v-validate="'required'"
          type="password"
          name="password"
          class="form-control"
          :class="{ 'is-invalid': submitted && vErrors.has('password') }"
          placeholder="Password"
          ref="password"
          />
        <div v-if="submitted && vErrors.has('password')" class="invalid-feedback">{{ vErrors.first('password') }}</div>
      </div>
      <div class="form-group">
        <label for="password_confirmation" class="sr-only">Confirm password</label>
        <input v-model="user.password_confirmation"
          v-validate="'required|confirmed:password'"
          type="password"
          name="password_confirmation"
          class="form-control"
          :class="{ 'is-invalid': submitted && vErrors.has('password_confirmation') }"
          placeholder="Confirm password"
          data-vv-as="password"
          />
        <div v-if="submitted && vErrors.has('password_confirmation')" class="invalid-feedback">{{ vErrors.first('password_confirmation') }}</div>
      </div>
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
    };
  },
  created() {
    this.checkSignedIn();
  },
  updated() {
    this.checkSignedIn();
  },
  methods: {
    handleSubmit(event) {
      this.submitted = true;
      this.$validator.validate().then(valid => {
        if (valid) {
            this.register(this.user);
        }
      });
    },
    register(param) {
      axios.post('http://localhost:3000/users', { user: param })
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
