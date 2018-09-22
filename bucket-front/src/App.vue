<template>
  <div id="app">
    <nav>
      <img src="./assets/bucket-logo.png" alt="BucketList logo" class="logo">
      <template>
        <div id="app">
        </div>
      </template>
      <ul class="nav-list">
        <li class="nav-list-item">Categories</li>
        <li class="nav-list-item">Locations</li>
        <li class="nav-list-item">Boards</li>
      </ul>
    </nav>

    <template>
      <div id="show-posts">
        <h1>hey buddy</h1>
        <input type="text" v-model="search" placeholder="Search through some posts..." class="search-field">
        <div v-for="post in filteredPosts">
          <h2>{{post.title || to-uppercase}}</h2>
          <article>{{post.body || snippet}}</article>
        </div>
      </div>
    </template>


    <router-view/>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'App',
  data() {
    return {
      posts: [],
      search: ''
    }
  },
  methods: {

  },
  created() {
    // axios.get(`https://jsonplaceholder.typicode.com/posts`)
    axios.get(`http://localhost:3000/posts`)
    .then(response => {
      this.posts = response.data
      })
      .catch(e => {
        this.errors.push(e)
      })
  },
  computed: {
    filteredPosts: function() {
      return this.posts.filter((post) => {
        return post.title.match(this.search)
      });
    }
  }
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  box-sizing: border-box;
}
nav {
  background: #39B885;
  height: 90px;
  display: block;

}
.logo {
  height: 70px;
  float: left;
  margin-left: 15px;
  margin-top: 10px;
}
.search-field {
  height: 40px;
  width: 500px;
  position: relative;
  top: 50%;
  font-size: 1.3em;
  margin-left: 20px;
  border-radius: 15px;

}
.nav-list {
  float: right;
  margin-top: initial;
  font-size: 1.7em;
}
.nav-list-item {
  display: inline-block;
  list-style: none;
  float: left;
  margin-left: 20px;
  margin-right: 20px;
  cursor: pointer;
}
.nav-list-item:hover {
  background: lightgrey;
  border-radius: 5%;
  padding: 10px;
}
</style>
