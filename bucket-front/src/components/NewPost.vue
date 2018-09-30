<template>
  <div id="app">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-container">
            <v-app v-bind:style="{ 
              height: calcHeight, 
              minWidth: calcWidth, 
              margin: calcMargin 
            }">

              <v-content v-bind:style="{ boxShadow: removeBoxShadow }">

                  <v-container>
                    <v-stepper v-model="step" v-bind="{ boxShadow: calcBoxShadow }" vertical>
                      <v-stepper-header v-bind:style="{ boxShadow: removeBoxShadow }">
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
                                Note <small>(Optional)</small>
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
                            label="Choose your boards or type to create a new one"
                            multiple
                            small-chips
                          >
                            <template slot="no-data">
                              <v-list-tile>
                                <v-list-tile-content>
                                  <v-list-tile-title>
                                    Press <kbd>enter</kbd> to create a new board.
                                  </v-list-tile-title>
                                </v-list-tile-content>
                              </v-list-tile>
                            </template>
                          </v-combobox>
                          <v-select
                            :items="categories"
                            v-model="newpost.categories"
                            item-text="name"
                            label="Choose your categories"
                            multiple
                            chips
                          ></v-select>

                          <v-btn flat @click.native="step = 2">Previous</v-btn>
                          <v-btn color="primary" @click="$emit('close')" @click.prevent="submit">Save</v-btn>

                        </v-stepper-content>
                      </v-stepper-items>
                    </v-stepper>

                  </v-container>

              </v-content>

            </v-app>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>


<script>
import axios from 'axios';

export default {
  mounted() {
    // this.$refs.address.focus();
  },

  data: () => ({
    errors: [],
    step: 1,
    newpost: {
      title: null,
      note: null,
      location: null,
      photo_url: null,
      city: null,
      board: null,
      categories: null,
    },
    boards: ['2019 Family Vacation', 'Weekend ideas', 'Anniversary Trip', 'Runaway plans'],
    categories: this.categories,
    search: null,
    address: this.address,
  }),
  computed: {
    removeBoxShadow: function() {
      return "initial"
    },
    calcHeight: function() {
      return "0px"
    },
    calcWidth: function() {
      return "822px"
    },
    calcMargin: function() {
      return "0 auto"
    },
    calcBoxShadow: function() {
      return "3px 0px 5px 0px rgba(0,0,0,0.75)"
    }
  },

  created() {
    axios.get(`http://localhost:3000/posts/`, {
    })
      .then((response) => {
        this.categories = response.data.categories;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },

  methods: {
    /**
    * When the location found
    * @param {Object} addressData Data of the found location
    * @param {Object} placeResultData PlaceResult object
    * @param {String} id Input container ID
    */
    getAddressData: function (placeResultData) {
      this.address = placeResultData;
    },

    submit() {
      const submitPost = {
        post: {
          title: this.newpost.title,
          note: this.newpost.note,
          photo_url: this.newpost.photo_url,
          user_id: 2,
          location: {
            city: this.address.locality,
            location: this.address.name,
            google_id: this.address.place_id,
            lat: (this.address.latitude * (10 ** 4)),
            long: (this.address.longitude * (10 ** 4)),
          },
          categories: this.newpost.categories,
          boards: this.newpost.boards,
        },
      };

      console.log(submitPost);

      axios.post('http://localhost:3000/posts/', submitPost)
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

<style scoped lang="stylus">

.modal-mask
  position: fixed
  z-index: 9998
  top: 0
  left: 0
  width: 100%
  height: 100%
  background-color: rgba(0, 0, 0, .5)
  // opacity: 0.8
  display: table
  // transition: opacity .3s ease
  height: 0px

  .model-wrapper
    display: table-cell
    vertical-align: middle

    .model-container
      width: 300px
      margin: 0px auto
      padding: 20px 30px
      background-color: #fff
      border-radius: 2px
      // box-shadow: 0 2px 8px rgba(0, 0, 0, .33)
      transition: all .3s ease
      font-family: Helvetica, Arial, sans-serif

      .application 
        height: 0
        background: red

.modal-enter
  // opacity: 0

.modal-leave-active
  // opacity: 0

</style>
