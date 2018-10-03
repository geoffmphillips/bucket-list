<template>
<div>
  <div class="post-container">
    <div class="card">
      <div class="header-container">
        <h3><strong>{{this.post.title}}</strong></h3>
      </div>
      <img :src="this.post.photo_url" :alt="this.post.note" class="post-img">
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
  <div class="comments-container">
    <button
      @click="this.toggleComments"
      v-if="!this.displayComments"
      type="button" name="button"
      class="btn btn-outline-primary"
    >View comments</button>
      <comments-container
        @newComment="updateComments"
        v-if="this.displayComments"
        id='fade-in'
        :comments="this.comments"
        :users="this.users"
      ></comments-container>
      <new-comment
        id='fade-in'
        v-if="this.displayComments"
        :post="this.post"
      ></new-comment>
    <button
      @click="this.toggleComments"
      v-if="this.displayComments"
      type="button"
      name="button"
      class="btn btn-outline-primary"
    >Hide comments</button>
  </div>
  <div class="map-container">
    <GmapMap
      :center="{
        lat: this.markers[0].position.lat,
        lng: this.markers[0].position.lng,
        }"
      :zoom="12"
      :options="{styles: this.$store.state.mapStyle.mapStyle}"
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
  methods: {
    toggleComments() {
      this.displayComments = !this.displayComments;
    },
    updateComments() {
      axios.get(`http://localhost:3000/posts/${this.$route.params.id}`)
        .then((response) => {
          const { comments, users } = response.data;
          this.comments = comments;
        })
        .catch((e) => {
          this.errors.push(e);
        });
    }
  },
  data() {
    return {
      displayComments: false,
      post: [],
      users: [],
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
        const { post, categories, location, comments, users, } = response.data;
        this.post = post;
        this.categories = categories;
        this.location = location;
        this.comments = comments;
        this.users = users;
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
#fade-in {
  transition-duration: 0.75s;
  transition-delay: 0.5s;
  transition-property: opacity;
  transition-timing-function: ease-in-out;
}
@keyframes fadeInOpacity {
	0% {
		opacity: 0;
	}
	100% {
		opacity: 1;
	}
}
div.header-container {
  display: flex;
  justify-content: center;
}
h3 {
  margin-top: 10px;
}
.post-container {
  display: flex;
  justify-content: center;
  margin-top: 45px;
}
div.card {
  width: max-content;
  height: auto;
  border-radius: 0.75em;
  margin-bottom: 10px;
}
.post-img {
  max-width: 750px;
  max-height: 438px;
}

div.card p {
  margin-left: 10px;
}
div.categories-container {
  display:flex;
  justify-content: center;
}
div.map-container {
  margin-top: 10px;
  margin-bottom: 30px;
  display: flex;
  justify-content: center;
}
div.comments-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
div.comments-container button {
  margin-bottom: 5px;
}

</style>
