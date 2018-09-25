<template>
  <div class="locations-container">
    <router-link :to="'/locations/' + this.locations[0].id" class="location-container">
      <h3><strong>{{this.locations[0].location}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.location1Posts[0].photo_url + ')' }"
      :post="this.location1Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/locations/' + this.locations[1].id" class="location-container">
      <h3><strong>{{this.locations[1].location}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.location2Posts[0].photo_url + ')' }"
      :post="this.location2Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/locations/' + this.locations[2].id" class="location-container">
      <h3><strong>{{this.locations[2].location}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.location3Posts[0].photo_url + ')' }"
      :post="this.location3Posts[0]"
      ></card-no-link>
    </router-link>
    <router-link :to="'/locations/' + this.locations[3].id" class="location-container">
      <h3><strong>{{this.locations[3].location}}</strong></h3>
      <card-no-link
      :style="{ backgroundImage: 'url(' + this.location4Posts[0].photo_url + ')' }"
      :post="this.location4Posts[0]"
      ></card-no-link>
    </router-link>
  </div>
</template>

<script>
import axios from 'axios';
import CardNoLink from './cards/CardNoLink';
import CardContainer from './cards/CardContainer';

export default {
  components: {
    CardNoLink,
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
        } = response.data;
        this.locations = locations;
        this.location1Posts = location1Posts;
        this.location2Posts = location2Posts;
        this.location3Posts = location3Posts;
        this.location4Posts = location4Posts;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>

<style scoped>
a {
  text-decoration: none;
  color: black;
  position: relative;
}
h3 {
  position: absolute;
  z-index: 2;
  color: white;
  font-size: 4em;
  width: max-content;
  top: 2em;
}
.location-container {
  display: flex;
  align-items: flex-start;
}
</style>
