<template lang="pug">
  v-jumbotron
    v-layout(align-center)
      .jumbotron-wrapper
        video.jumbotron(type='video/mp4', autoplay loop muted)
          source(src='../assets/pexels.mp4', type='video/mp4')
        .overlay-desc
          h2 Welcome to the Future
          h2 of Discovery
</template>

<script>
export default {
  name: 'Jumbotron',
  components: {

  },
  created() {
    console.log('jumbotron created')
  }
}
</script>

<style lang="stylus">
.jumbotron-wrapper
  margin: 0 auto
  min-height: 450px

  .overlay-desc
    background: rgba(0,0,0,0)
    color: white;
    position: absolute
    top: 0; right: 0; bottom: 0; left: 0
    display: flex
    text-align: center
    font-size: 3em
    display: inline-block
    margin-top: 10%
    animation: fadein 8s
    opacity: 0

  .jumbotron
    width: 100%

@keyframes fadein
  0%
    opacity: 0
  80%
    opacity: 1
  100%
    opacity: 0


</style>
