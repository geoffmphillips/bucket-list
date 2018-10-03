<template>
<div>
  <div class="post-container">
    <div class="card">
      <div class="header-container">
        <h3><strong>{{this.post.title}}</strong></h3>
        <div class="board-count">
          <p>{{ this.count }}</p>
          <i style="color: gold;" @click="toggleFavorite" v-if="this.isFavorite" class="fas fa-star"></i>
          <i style="color: gold;" @click="toggleFavorite" v-if="!this.isFavorite" class="far fa-star"></i>
        </div>
      </div>
      <img :src="this.post.photo_url" :alt="this.post.note" class="post-img">
      <div class="categories-container">
        <category-tag
          v-for="category in categories"
          :key="category.id"
          :category="category"
        ></category-tag>
      </div>
      <p
        v-if="this.current_user"
        >Boards this post appears in: <board-link v-for="board in this.boards" :key="board.id" :board="board"></board-link></p>
        <hr>
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
      :zoom="13"
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
import BoardLink from './BoardLink';
import CommentsContainer from './CommentsContainer';
import NewComment from './NewComment';

export default {
  name: 'Post',
  components: {
    CategoryTag,
    CommentsContainer,
    NewComment,
    BoardLink,
  },
  methods: {
    toggleFavorite() {
      axios.put(`http://localhost:3000/board_items/${this.$route.params.id}`)
        .then((response) => {
          this.isFavorite = response.data.favorite;
          this.count = response.data.count;
          this.boards = response.data.boards;
        })
        .catch((e) => {
          this.errors.push(e);
        });
    },
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
    },
    favorites() {
      axios.get(`http://localhost:3000/board_items/${this.$route.params.id}`)
      .then((response) => {
        this.count = response.data.count;
        this.isFavorite = response.data.favorite;
      })
      .catch((error) => {
        this.errors.push(error);
      });
    },
  },
  data() {
    return {
      displayComments: false,
      post: [],
      count: null,
      isFavorite: false,
      users: [],
      boards: [],
      current_user: {},
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
        const { post, categories, location, comments, users, boards, current_user, } = response.data;
        this.post = post;
        this.categories = categories;
        this.location = location;
        this.comments = comments;
        this.users = users;
        this.current_user = current_user;
        this.boards = boards;
        this.markers[0].position.lat = (this.location.lat * (10 ** -4));
        this.markers[0].position.lng = (this.location.long * (10 ** -4));
        this.favorites();
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
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
  max-width: 800px;
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
.board-count {
  display: block;
  margin-left: 18px;
  width: 51px;
  margin-top: 7px;
  font-size: 20px;
}
.board-count p {
  display: inline;
}


</style>
