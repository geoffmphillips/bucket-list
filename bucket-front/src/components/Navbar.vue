<template lang="pug">
  v-toolbar.navbar(
    :color="$vuetify.breakpoint.smAndDown ? 'primary' : 'default'"
    :dark="$vuetify.breakpoint.smAndDown"
    fixed
    app
    dense
  )
    router-link(:to="'/'")
      img.navbar__logo(src='../assets/bucket-logo.png', alt='BucketList logo')
    v-autocomplete.navbar__search-field(
      v-model='model',
      :items='stuff',
      item-text='name',
      :label='`Search some buckets...`',
      return-object='',
      color="darkslategrey",
    )
    v-spacer
    v-toolbar-items.navbar__list
      router-link(:to="'/categories'")
        v-btn.navbar__list-item(flat='') Categories
      router-link(:to="'/locations'")
        v-btn.navbar__list-item(flat='') Locations

    v-toolbar-side-icon.navbar__sidebar-btn(v-show="!backButton" @click.stop="toggleSidebar()")
    v-btn(icon v-show="backButton" @click.stop="$router.back()")
      v-icon arrow_back
</template>

<script>
  export default {
    name: 'Navbar',
    components: {

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
        model: '',
      }
    },
    methods: {
      toggleSidebar () {
        this.$store.dispatch('common/updateSidebar', { visible: !this.$store.state.common.sidebar.visible })
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
      }
    }
  };
</script>

<style lang="stylus">
#app
  font-family: 'Avenir', Helvetica, Arial, sans-serif
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  color: #2c3e50
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

    &__search-field
      height: 40px
      width: 500px
      position: relative
      top: 50%
      font-size: 1.3em
      margin-left: 20px; margin-bottom: 15px
      border-radius: 15px

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
