<template>
  <v-toolbar class="navbar" fixed="fixed" app="app" dense="dense">
    <router-link :to="'/'"><img class="navbar__logo" src="../assets/bucket-logo.png" alt="BucketList logo" /></router-link>
    <basic-select :options="options" :selected-option="item" placeholder="select item" @select="onSelect"></basic-select>
    <v-spacer></v-spacer>
    <v-toolbar-items class="navbar__list">
      <div class="modal-button navbar__list-item">
        <button id="show-modal" @click="showModal = true">NEW POST</button>
        <new-post v-if="showModal" @close="showModal = false"></new-post>
      </div>
    </v-toolbar-items>
    <v-spacer></v-spacer>
    <v-menu bottom="" left="">
      <v-btn slot="activator" icon="">
        <v-icon>more_vert</v-icon>
      </v-btn>
      <v-list>
        <v-list-tile v-for="(item, i) in items" :key="i" @click="" :to="item.route">
          <v-list-tile-title>{{ item.title }}</v-list-tile-title>
        </v-list-tile>
      </v-list>
    </v-menu>
  </v-toolbar>
</template>

<script>
import NewPost from './NewPost'
import { BasicSelect } from 'vue-search-select'

  export default {
    name: 'Navbar',
    inject: ['$validator'],
    components: {
      NewPost,
      BasicSelect,
    },

    mounted () {
      document.addEventListener("keydown", (e) => {
        if (e.keyCode == 27) {
          this.showModal = false;
        }
      });
    },

    data() {
      return {
        showModal: false,
        options: [],
        searchText: '', // If value is falsy, reset searchText & searchItem
        item: {
          value: '',
          text: ''
        },
        posts: [],
        items: [
        {
          title: 'Login',
          route: '/login',
        },
        {
          title: 'Locations',
          route: '/locations',
        },
        {
          title: 'Categories',
          route: '/categories',
        },
        {
          title: 'Register',
          route: '/register',
        }
      ],
      }
    },
    methods: {
      onSelect (item) {
        console.log(item.value);
        this.$router.push({ path: `/posts/${item.value}`});
      },
      reset () {
        this.item = {};
      },
      selectOption () {
        this.item = this.options[0];
      },
    },
    created() {
      axios.get(`http://localhost:3000/posts`)
      .then(response => {
        this.posts = response.data.posts.sort((a, b) => {
          let nameA = a.title.toUpperCase()
          let nameB = b.title.toUpperCase()
          if (nameA < nameB) {
            return -1;
          } else if (nameB < nameA) {
            return 1;
          } else {
            return 0;
          }
        });
        this.posts.forEach((post) => {
          this.options.push({
            value: post.id,
            text: post.title,
          })
        });
      })
      .catch(e => {
        this.errors.push(e)
      })
    },
  };
</script>

<style lang="stylus">
#app
  font-family: 'Montserrat', sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  // color: #2c3e50
  box-sizing: border-box

  .navbar
    // background: #0074c6
    background white
    height: 90px
    display: block
    top: 0

    &__logo
      height: 50%
      float: left
      margin-top: 40%; margin-right: 2%; margin-left: 2%
      cursor: pointer
      margin-right 10%

    .selection
      width 38em
      margin-top: 30px
      background #f7f7f7

      .dropdown
        color #0074c6

    &__list
      float: right
      margin-top: 3%

      &-item
        display: inline-block
        list-style: none
        float: left
        font-size: 1.2em
        margin-left: 30px
        margin-right: 30px
        color #0074c6
        font-weight: bold

    &__sidebar-btn
      font-size: 4em
      margin-top: .9em
</style>
