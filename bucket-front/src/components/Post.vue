<template>
<div>
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
  </div>
  <div class="map-container">
    <GmapMap
      :center="{
        lat: this.markers[0].position.lat,
        lng: this.markers[0].position.lng,
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
          lat: 0,
          lng: 0,
        },
      },
      ],
      errors: [],
    };
  },
  created() {
    axios.get(`http://localhost:3000/posts/${this.$route.params.id}`)
      .then((response) => {
        this.post = response.data.post;
        this.categories = response.data.categories;
        this.markers[0].position.lat = (this.post.lat * (10 ** -4));
        this.markers[0].position.lng = (this.post.long * (10 ** -4));
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
.post-container {
  display: flex;
  justify-content: center;
}
div.card {
  width: max-content;
  height: auto;
  border-radius: 0.75em;
}
div.categories-container {
  display:flex;
  justify-content: center;
}
div.map-container {
  display: flex;
  justify-content: center;
}

</style>
