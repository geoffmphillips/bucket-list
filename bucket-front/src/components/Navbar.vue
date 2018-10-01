<template lang="pug">
  v-toolbar.navbar(
    fixed
    app
    dense
  )
    router-link(:to="'/'")
      img.navbar__logo(src='../assets/bucket-logo.png', alt='BucketList logo')
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
        searchText: '', // If value is falsy, reset searchText & searchItem
        item: {
          value: '',
          text: ''
        },
        posts: [],
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
    background: #0074c6
    height: 90px
    display: block
    top: 0

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

        .add-icon
          margin-left: 10px

    &__sidebar-btn
      font-size: 4em
      margin-top: .9em
</style>
