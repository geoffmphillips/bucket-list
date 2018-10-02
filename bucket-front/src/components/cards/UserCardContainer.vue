<template lang="pug">
  .panel-container(
    fit-width="true",
    percent-position: true,
    item-selector='.item',
    :origin-top="true",
    :horizontal-order="false",
  )
    card.item(
      v-for='(post, index) in posts',
      :key='post.id',
      :style="{ backgroundImage: 'url(' + post.photo_url + ')', backgroundSize: 'cover' }",
      :post='post',
    )
</template>

<script>
import Card from './Card';

export default {
  props: {
    posts: {
      type: Array,
    },
  },
  components: {
    Card
  },
};
</script>

<style scoped lang="stylus">

</style>
