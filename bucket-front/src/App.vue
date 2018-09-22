<template>
  <div id="app">
    <nav>
      <img src="./assets/bucket-logo.png" alt="BucketList logo" class="logo">
      <ul class="nav-list">
        <li class="nav-list-item">Categories</li>
        <li class="nav-list-item">Locations</li>
        <li class="nav-list-item">Boards</li>
      </ul>
    </nav>

    <v-app id="inspire">
      <v-card>
        <v-card-title class="headline font-weight-regular blue-grey white--text">Profile</v-card-title>
        <v-card-text>
          <v-subheader class="pa-0">Where is your next inspiration?</v-subheader>
          <v-autocomplete
            v-model="model"
            :items="stuff"
            :label="`Search some buckets...`"
            persistent-hint
            prepend-icon="mdi-city"
            return-object
            item-text="name"
          >
            <v-slide-x-reverse-transition
              slot="append-outer"
              mode="out-in"
            >
            <v-icon
              :color="isEditing ? 'success' : 'info'"
              :key="`icon-${isEditing}`"
              @click="isEditing = !isEditing"
              v-text="isEditing ? 'mdi-check-outline' : 'mdi-circle-edit-outline'"
            ></v-icon>
            </v-slide-x-reverse-transition>
          </v-autocomplete>
        </v-card-text>
      </v-card>
    </v-app>


    <router-view/>
  </div>
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
import Vuetify from 'vuetify'

export default {
  name: 'App',
  data() {
    return {
      autoUpdate: true,
      friends: [],
      isUpdating: false,
      name: 'Midnight Crew',
      stuff: [
        {
          name: "kyle",
          group: "tycholiz"
        },
        {
          name: "Eli",
          group: "Arias"
        }
      ],
    }
  },
  methods: {

  },
  created() {
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
  },
  watch: {
    isUpdating (val) {
      if (val) {
        setTimeout(() => (this.isUpdating = false), 3000)
      }
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
