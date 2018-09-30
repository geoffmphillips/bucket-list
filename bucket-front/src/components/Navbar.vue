<template lang="pug">
  v-toolbar.navbar(
    fixed
    app
    dense
  )
    router-link(:to="'/'")
      img.navbar__logo(src='../assets/bucket-logo.png', alt='BucketList logo')
    v-autocomplete.navbar__search-field(
      :items='Animals'
      :component-item='template'
      @update-items="updateItems"
      @item-selected="itemSelected"
      @item-clicked="itemClicked"
      :input-attrs="{name: 'input-test', id: 'v-my-autocomplete'}"
    )
    v-spacer
    v-toolbar-items.navbar__list
      .modal-button
        button#show-modal(@click='showModal = true') New Post
        new-post(v-if="showModal", @close='showModal = false')
      router-link(:to="'/categories'")
        v-btn.navbar__list-item(flat='') Categories
      router-link(:to="'/locations'")
        v-btn.navbar__list-item(flat='') Locations

    v-toolbar-side-icon.navbar__sidebar-btn(v-show="!backButton" @click.stop="toggleSidebar()")
    v-btn(icon v-show="backButton" @click.stop="$router.back()")
      v-icon arrow_back
</template>

<script>
import ItemTemplate from './ItemTemplate'
import NewPost from './NewPost'
import Animals from './animals.js'

  export default {
    name: 'Navbar',
    inject: ['$validator'],
    components: {
      NewPost
    },
    props: {
      backButton: {
        type: Boolean,
        default: false
      }
    },

    mounted () {
      document.addEventListener("keydown", (e) => {
        if (e.keyCode == 27) {
          console.log("closing!");
          this.showModal = false;
        }
      });
    },

    data() {
      return {
        showModal: false,
        model: '',
        posts: [],
        item: {
          id: 9,
          name: 'Lion',
          description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
        },
        items: [],
        template: ItemTemplate
      }
    },
    methods: {
      itemSelected(item) {
        console.log("item selected:", item.name)
      },
      itemClicked(item) {
        console.log("item clicked:", item.name)
      },
      updateItems (text) {
        this.items = Animals.filter((item) => {
          return (new RegExp(text.toLowerCase())).test(item.name.toLowerCase())
        })
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
  };
</script>

<style lang="stylus">
#app
  font-family: 'Montserrat', sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  color: #2c3e50
  box-sizing: border-box

  .navbar
    background: #0074c6
    height: 90px
    display: block

    &__logo
      height: 70px
      float: left
      margin-top: 40px; margin-right: 10px; margin-left: 10px
      cursor: pointer

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

    &__sidebar-btn
      font-size: 4em
      margin-top: .9em
</style>
