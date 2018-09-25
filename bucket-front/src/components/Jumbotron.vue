<template>
  <div class="video-container">
    <video loop muted autoplay poster="../assets/Two-Swimmers.jpg" class="bg-video">
      <source src="../assets/Two-Swimmers.webm" type="video/webm">
      <source src="../assets/Two-Swimmers.mp4" type="video/mp4">
      <!-- <source src="../assets/Two-Swimmers.ogv" type="video/ogg"> -->
    </video>
  </div>
</template>

<script>
export default {
  name: 'Jumbotron',
};
</script>

<style scoped>

</style>
