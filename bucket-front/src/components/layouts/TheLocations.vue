<template>
  <div class="locations-container">
    <location-card
      v-for="(location, index) in locations"
      :location="location"
      :post="posts[index]"
      :key="index"
    ></location-card>
  </div>
</template>

<script>
import axios from 'axios';
import LocationCard from '../cards/LocationCard';

export default {
  components: {
    LocationCard
  },
  data() {
    return {
      locations: [],
      posts: [],
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
        this.posts = [ location1Posts,
                       location2Posts,
                       location3Posts,
                       location4Posts ]
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
