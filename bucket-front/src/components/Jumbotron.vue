<template lang="pug">
  v-jumbotron.jumbotron
    video.jumbotron__video(type='video/mp4', autoplay loop muted)
      source(src='../assets/pexels.mp4', type='video/mp4')
    .jumbotron__overlay
      h2.-text1 Welcome to the Future
      h2.-text2 of Discovery
</template>

<script>
export default {
  name: 'Jumbotron',
  components: {

  },
  created() {
  }
}
</script>

<style lang="stylus">
.jumbotron
  min-height: 550px
  width: 90%
  margin: 0 auto 50px

  &__video
    width: 100%

  &__overlay
    background: rgba(0,0,0,0)
    color: white;
    position: absolute
    top: 0; right: 0; bottom: 0; left: 0
    display: flex
    text-align: center
    font-size: 3em
    display: inline-block
    margin-top: 10%
    animation: fadein 12s
    opacity: 0

@keyframes fadein
  0%
    opacity: 0
  50%
    opacity: 1
  80%
    opacity: 1
  100%
    opacity: 0


</style>
