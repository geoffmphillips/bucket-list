<template>
  <div id='app'>
    <router-link to='/'>
      <img src="./assets/bucket-small.png" height="40">
    </router-link>
    <router-view/>
  </div>
</template>

<script>
import Jumbotron from './components/Jumbotron';

export default {
  name: 'App',
  components: {
    Jumbotron,
  },
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 20px;
}
</style>
