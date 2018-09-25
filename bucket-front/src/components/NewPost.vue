<template>
  <div id="app">
    <v-app>

      <v-content>

          <v-container>
            <v-stepper v-model="step" vertical>
              <v-stepper-header>
                <v-stepper-step step="1" :complete="step > 1">Locate it</v-stepper-step>
                <v-divider></v-divider>
                <v-stepper-step step="2" :complete="step > 2">Describe it</v-stepper-step>
                <v-divider></v-divider>
                <v-stepper-step step="3">Categorize it</v-stepper-step>
              </v-stepper-header>
              <v-stepper-items>
                <v-stepper-content step="1">

                  <vuetify-google-autocomplete
                    label="Location"
                    v-model="newpost.location"
                    id="map"
                    ref="address"
                    types=""
                    append-icon="search"
                    placeholder="Start typing"
                    v-on:placechanged="getAddressData"
                  >
                  </vuetify-google-autocomplete>

                  <v-btn color="primary" @click.native="step = 2">Continue</v-btn>
                </v-stepper-content>
                <v-stepper-content step="2">

                    <v-text-field label="Title" v-model="newpost.title"></v-text-field>
                    <v-textarea label="Note" v-model="newpost.note">
                      <div slot="label">
                        Description <small>(Optional)</small>
                      </div>
                    </v-textarea>
                    <v-text-field
                      label="Image URL (Optional)"
                      v-model="newpost.photo_url"
                    ></v-text-field>

                  <v-btn flat @click.native="step = 1">Previous</v-btn>
                  <v-btn color="primary" @click.native="step = 3">Continue</v-btn>

                </v-stepper-content>
                <v-stepper-content step="3">

                  <v-combobox
                    v-model="newpost.boards"
                    :items="boards"
                    :search-input.sync="search"
                    hide-selected
                    label="Choose your buckets or type to create a new one"
                    multiple
                    small-chips
                  >
                    <template slot="no-data">
                      <v-list-tile>
                        <v-list-tile-content>
                          <v-list-tile-title>
                            No results matching "<strong>{{ search }}</strong>". Press <kbd>enter</kbd> to create a new one
                          </v-list-tile-title>
                        </v-list-tile-content>
                      </v-list-tile>
                    </template>
                  </v-combobox>
                  <v-select
                    :items="categories"
                    v-model="newpost.categories"
                    label="Choose your categories"
                    multiple
                    chips
                  ></v-select>

                  <v-btn flat @click.native="step = 2">Previous</v-btn>
                  <v-btn color="primary" @click.prevent="submit">Save</v-btn>

                </v-stepper-content>
              </v-stepper-items>
            </v-stepper>

          </v-container>

      </v-content>

    </v-app>
    <br><br>Debug: {{newpost}}
    </div>
</template>


<script>
import axios from 'axios';

export default {
  mounted() {
    this.$refs.address.focus();
  },

  data: () => ({
    errors: [],
    step: 1,
    newpost: {
      title: null,
      note: null,
      location: null,
      photo_url: null,
      board: null,
      categories: null,
    },
    boards: ['2019 Family Vacation', 'Weekend ideas', 'Anniversary Trip', 'Runaway plans'],
    categories: ['Beach', 'Romantic', 'Backpacking', 'Roadtrip', 'Foodie', 'Cultural'],
    search: null,
  }),

  methods: {
    /**
    * When the location found
    * @param {Object} addressData Data of the found location
    * @param {Object} placeResultData PlaceResult object
    * @param {String} id Input container ID
    */
    getAddressData: function getAddressData(addressData, placeResultData, id) {
      this.address = {};
    },
    submit() {
      axios.post('http://localhost:3000/posts/', {
        title: this.newpost.title,
        note: this.newpost.note,
        location: this.newpost.location,
        photo_url: this.newpost.photo_url,
        lat: 1.5,
        long: 1.00,
        user_id: 2,
      })
        .then((response) => {
          this.newpost = response.data;
        })
        .catch((error) => {
          this.errors.push(error);
        });
    },
  },
};
</script>

<style scoped>

</style>
