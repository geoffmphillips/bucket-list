<template lang="pug">
  #app

    v-app#search
      v-toolbar.my-appbar(flat fixed app dense)
        img.logo(src='./assets/bucket-logo.png', alt='BucketList logo')
        v-autocomplete.search-field(v-model='model', :items='stuff', item-text='name', :label='`Search some buckets...`', return-object='')
        v-spacer
        v-toolbar-items.nav-list
          v-btn.nav-list-item(flat='') Categories
          v-btn.nav-list-item(flat='') Locations
          v-btn.nav-list-item(flat='') Boards
        v-toolbar-side-icon(v-show="!backButton" @click.stop="toggleSidebar()")
        v-btn(icon v-show="backButton" @click.stop="$router.back()")
          v-icon arrow_back

    v-app#jumbotron
      v-jumbotron
        v-container(max-height)
          v-layout(align-center)
            v-flex
              .jumbotron-wrapper
                video.jumbotron(type='video/mp4', autoplay='', loop='', muted='')
                  source(src='./assets/pexels.mp4', type='video/mp4')
                .video-overlay
                .page-width
                  .video-hero--content
                    h2(style='background: red') Background Video Dem
                    p Full width video hero

    router-view
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
import Vuetify from 'vuetify'

export default {
  name: 'App',
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
    }
  },
  methods: {
    // toggleSidebar () {
    //   this.$store.dispatch('common/updateSidebar', { visible: !this.$store.state.common.sidebar.visible })
    // }
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
  .container
    padding: 0 !important

  #app
    font-family: 'Avenir', Helvetica, Arial, sans-serif
    -webkit-font-smoothing: antialiased
    -moz-osx-font-smoothing: grayscale
    color: #2c3e50
    box-sizing: border-box

    nav
      background: #39B885
      height: 90px
      display: block

      .logo
        height: 70px
        float: left
        margin-left: 15px
        margin-top: 10px

      .search-field
        height: 40px
        width: 500px
        position: relative
        top: 50%
        font-size: 1.3em
        margin-left: 20px
        border-radius: 15px

      .nav-list
        float: right
        margin-top: 3%
        font-size: 1.7em

      .nav-list-item
        display: inline-block
        list-style: none
        float: left
        margin-left: 20px
        margin-right: 20px
</style>
