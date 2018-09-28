<template>
<div>
  <div class="post-container">
    <div class="card">
      <p>{{this.post.title}}</p>
      <img :src="this.post.photo_url" :alt="this.post.note">
      <div class="categories-container">
        <category-tag
          v-for="category in categories"
          :key="category.id"
          :category="category"
        ></category-tag>
      </div>
      <p>{{this.post.note}}</p>
    </div>
  </div>
  <comments-container
    :comments="this.comments"
  ></comments-container>
  <new-comment
    :post="this.post"
  ></new-comment>
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
import CategoryTag from './CategoryTag';
import CommentsContainer from './CommentsContainer';
import NewComment from './NewComment';

export default {
  name: 'Post',
  components: {
    CategoryTag,
    CommentsContainer,
    NewComment,
  },
  data() {
    return {
      post: [],
      comments: [],
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
        const { post, categories, location, comments, } = response.data;
        this.post = post;
        this.categories = categories;
        this.location = location;
        this.comments = comments,
        this.markers[0].position.lat = (this.location.lat * (10 ** -4));
        this.markers[0].position.lng = (this.location.long * (10 ** -4));
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
