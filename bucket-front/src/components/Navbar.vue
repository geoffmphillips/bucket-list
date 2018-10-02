<template lang="pug">
  v-toolbar.navbar(
    fixed
    app
    dense
  )
    router-link(:to="'/'")
      img.navbar__logo(src='../assets/path862.png', alt='BucketList logo')
    basic-select(
      :options="options"
      :selected-option="item"
      placeholder="select item"
      @select="onSelect"
      )
    v-spacer
    v-toolbar-items.navbar__list
      router-link(:to="'/categories'" ripple)
        v-btn.navbar__list-item(flat='') Categories
      router-link(:to="'/locations'" ripple)
        v-btn.navbar__list-item(flat='') Locations
      .modal-button.navbar__list-item
        button#show-modal(@click='showModal = true') NEW POST
        new-post(
          v-if="showModal",
          @close='showModal = false'
        )
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
        categories: [],
        locations: [],
        searchText: '',
        item: {
          value: '',
          text: ''
        },
        posts: [],
      }
    },
    methods: {
      onSelect(item) {
        this.$router.push({ path: `/${item.type}/${item.value}`});
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
            type: 'posts',
          });
        });
        this.categories = response.data.categories;
        this.categories.forEach((category) => {
          this.options.push({
            value: category.id,
            text: 'Category: ' + category.name,
            type: 'categories',
          });
        });
        this.locations = response.data.locations;
        this.locations.forEach((location) => {
          this.options.push({
            value: location.id,
            text: 'Location: ' + location.location,
            type: 'locations',
          });
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
  box-sizing: border-box

  .navbar
    background white
    height: 90px
    display: block
    top: 0

    &__logo
      height: 70px
      float: left
      margin-top: 30px; margin-right: 10px; margin-left: 10px
      cursor: pointer
      margin-right 30px


    .selection
      width 38em
      margin-top: 30px
      background #f7f7f7

      .dropdown
        color #0074c6

    &__list
      float: right
      margin-top: 3%

      & > a
        padding-top 10px

      &-item
        display: inline-block
        list-style: none
        float: left
        font-size: 1.2em
        margin-left: 30px
        margin-right: 30px
        color #0074c6
        font-weight: bold

        #show-modal
          background #0074c6
          color white
          padding 7px
          border 1px solid grey
          border-radius 9px
          white-space nowrap 
          overflow hidden

          &:hover
            background #979797

          &:active
            background #878787

    &__sidebar-btn
      font-size: 4em
      margin-top: .9em
</style>
