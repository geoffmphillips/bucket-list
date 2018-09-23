<template>
<div class="post-container">
  <div class="card">
    <p>{{this.post.title}}</p>
    <img :src="this.post.photo_url" :alt="this.post.note">
    <div class="categories-container">
      <category
        v-for="category in categories"
        :key="category.id"
        :category="category"
      ></category>
    </div>
    <p>{{this.post.note}}</p>
  </div>
  <GmapMap
    :center="{
      lat: 49.2827,
      lng: -123.1207,
      }"
    :zoom="12"
    :options="{styles: this.$store.state.mapStyle}"
    map-type-id="roadmap"
    style="width: 500px; height: 300px"
  >
  <GmapMarker
    :key="index"
    v-for="(m, index) in this.markers"
    :position="m.position"
    :clickable="true"
    :draggable="true"
    @click="center=m.position"
  />
  </GmapMap>
</div>
</template>

<script>
import axios from 'axios';
import Category from './Category';

export default {
  name: 'Post',
  components: {
    Category,
  },
  data() {
    return {
      post: [],
      categories: [],
      markers: [{
        position: {
          lat: 49.2827,
          lng: -123.1207,
        },
      },
      ],
      errors: [],
    };
  },
  created() {
    axios.get(`http://localhost:3000/posts/${this.$route.params.id}`, {
      params: {
        id: 1,
      },
    })
      .then((response) => {
        this.post = response.data;
        this.categories = this.post.categories;
        this.markers.position.lat = this.post.lat;
        this.markers.position.lng = this.post.long;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
div.card {
  width: max-content;
  height: auto;
  border-radius: 0.75em;
}
div.categories-container {
  display:flex;
  justify-content: center;
}

</style>
