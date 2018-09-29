<template lang="pug">
  v-toolbar.navbar(
    color="$vuetify.breakpoint.smAndDown ? 'primary' : 'secondary'"
    :dark="$vuetify.breakpoint.smAndDown"
    fixed
    app
    dense
  )
    router-link(:to="'/'")
      img.navbar__logo(src='../assets/bucket-logo.png', alt='BucketList logo')
      
    v-autocomplete.navbar__search-field(
      v-model='item',
      :items='items',
      item-text='name',
      :label='`Search for buckets...`',
      placeholder='Search for buckets...',
      return-object,
      color="darkslategrey",
      :search-input.sync="search",
      @item-selected="itemSelected",
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

    v-toolbar-side-icon.navbar__sidebar-btn(v-show="!backButton" @click.stop="toggleSidebar()")
    v-btn(icon v-show="backButton" @click.stop="$router.back()")
      v-icon arrow_back
</template>

<script>
import NewPost from './NewPost'

  export default {
    name: 'Navbar',
    components: {
      NewPost,
    },
    props: {
      backButton: {
        type: Boolean,
        default: false
      }
    },
    data() {
      return {
        autoUpdate: true,
        showModal: false,
        friends: [],
        isUpdating: false,
        name: 'Midnight Crew',
        items: [
          {
            name: "kyle",
            group: "tycholiz"
          },
          {
            name: "Eli",
            group: "Arias"
          }
        ],
        model: '',
      }
    },
    methods: {
      toggleSidebar () {
        this.$store.dispatch('common/updateSidebar', { visible: !this.$store.state.common.sidebar.visible })
      },
      itemSelected(item) {
        console.log(item)
      }
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
      },
      search (val) {
        console.log(this.stuff)
      }
    }
  }
</script>

<style lang="stylus">
#app
  font-family: 'Avenir', Helvetica, Arial, sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  // color: #2c3e50
  box-sizing: border-box

  .navbar
    background: #39B885
    height: 90px
    display: block

    &__logo
      height: 70px
      float: left
      margin-top: 40px; margin-right: 10px; margin-left: 10px
      cursor: pointer

    // &__search-field
    //   height: 40px
    //   width: 500px
    //   position: relative
    //   top: 50%
    //   font-size: 1.3em
    //   margin-left: 20px; margin-bottom: 15px
    //   border-radius: 4px
    //   border: 1px solid black
    //   background: #ffffff

    .v-autocomplete
      .v-autocomplete-input-group
        .v-autocomplete-input
          font-size 1.5em
          padding 10px 15px
          box-shadow none
          border 1px solid #157977
          width calc(100% - 32px)
          outline none
          background-color #eee
        &.v-autocomplete-selected
          .v-autocomplete-input
            color green
            background-color #f2fff2
      .v-autocomplete-list
        width 100%
        text-align left
        border none
        border-top none
        max-height 400px
        overflow-y auto
        border-bottom 1px solid #157977
        .v-autocomplete-list-item
          cursor pointer
          background-color #fff
          padding 10px
          border-bottom 1px solid #157977
          border-left 1px solid #157977
          border-right 1px solid #157977
          &:last-child
            border-bottom none
          &:hover
            background-color #eee
          abbr
            opacity 0.8
            font-size 0.8em
            display block
            font-family sans-serif

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
