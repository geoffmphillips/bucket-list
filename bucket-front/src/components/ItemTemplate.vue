<template lang="pug">
  div
    b {{ item.name }}
    abbr {{ item.description }}
 </template>

<script>
export default {
  props: {
    item: { required: true },
    searchText: { required: true }
  }
}
</script>
