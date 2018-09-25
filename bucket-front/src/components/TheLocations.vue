<template>
  <div>
    <div class="location-container">
      <div class="header">
        <h3><strong>{{this.locations[0].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.location1Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="location-container">
      <div class="header">
        <h3><strong>{{this.locations[1].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.location2Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="location-container">
      <div class="header">
        <h3><strong>{{this.locations[2].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.location3Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="location-container">
      <div class="header">
        <h3><strong>{{this.locations[3].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.location4Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="location-container">
      <div class="header">
        <h3><strong>{{this.locations[4].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.location5Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="location-container">
      <div class="header">
        <h3><strong>{{this.locations[5].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.location6Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
    <div class="location-container">
      <div class="header">
        <h3><strong>{{this.locations[6].name}}</strong></h3>
      </div>
      <div class="posts-container">
        <card
        v-for="post in this.location7Posts"
        :key="post.id"
        :style="{ backgroundImage: 'url(' + post.photo_url + ')' }"
        :post="post"
        ></card>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Card from './cards/Card';
import CardContainer from './cards/CardContainer';

export default {
  components: {
    Card,
    CardContainer,
  },
  data() {
    return {
      locations: [],
      location1Posts: [],
      location2Posts: [],
      location3Posts: [],
      location4Posts: [],
      location5Posts: [],
      location6Posts: [],
      location7Posts: [],
      errors: [],
    };
  },
  created() {
    axios.get('http://localhost:3000/locations')
      .then((response) => {
        const { locations,
          location1Posts,
          location2Posts,
          location3Posts,
          location4Posts,
          location5Posts,
          location6Posts,
          location7Posts } = response.data;
        this.locations = locations;
        this.location1Posts = location1Posts;
        this.location2Posts = location2Posts;
        this.location3Posts = location3Posts;
        this.location4Posts = location4Posts;
        this.location5Posts = location5Posts;
        this.location6Posts = location6Posts;
        this.location7Posts = location7Posts;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
.location-container {
  display: flex;
  align-items: flex-start;
}
.posts-container {
  display: flex;
  flex-flow: row wrap;
  align-items: flex-start;
  flex-grow: 3;
}
.header {
  width: 400px;
}
</style>
