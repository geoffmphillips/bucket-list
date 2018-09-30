<template>
  <div id="app">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper" :style="{ boxShadow: removeBoxShadow }">
          <div class="modal-container">
            <v-app :style="{ height: calcHeight }">

              <v-content :style="{ boxShadow: removeBoxShadow }">

                  <v-container>
                    <v-stepper v-model="e1" :style='modalContainer'>
                      <v-stepper-header :style="{ boxShadow: removeBoxShadow }">
                        <v-stepper-step step="1" :complete="e1 > 1">Locate it</v-stepper-step>
                        <v-divider></v-divider>
                        <v-stepper-step step="2" :complete="e1 > 2">Describe it</v-stepper-step>
                        <v-divider></v-divider>
                        <v-stepper-step step="3" :complete="e1 > 3">Photograph it</v-stepper-step>
                        <v-divider></v-divider>
                        <v-stepper-step step="4">Categorize it</v-stepper-step>
                      </v-stepper-header>
                      <v-stepper-items>
                        <v-stepper-content step="1">
                          <form data-vv-scope="form1">

                          <vuetify-google-autocomplete
                            label="Location (Required)"
                            v-model="newpost.location"
                            id="map"
                            ref="address"
                            types=""
                            name="location"
                            v-validate="'required'"
                            :error-messages="vErrors.first('location')"
                            data-vv-name="location" required data-vv-scope="form1"
                            placeholder="Start typing"
                            v-on:placechanged="getAddressData"
                          >
                          </vuetify-google-autocomplete>

                          <v-btn color="error" @click="$emit('close')">Cancel</v-btn>
                          <v-btn color="primary" @click.native="submitForm('form1')">Continue</v-btn>
                        </form>
                        </v-stepper-content>
                        <v-stepper-content step="2">
                          <form data-vv-scope="form2">

                            <v-text-field
                              label="Title"
                              name="title"
                              v-model="newpost.title"
                              :error-messages="vErrors.first('title')"
                              :class="{ 'is-danger': vErrors.has('title') }"
                              v-validate="'required'"
                              data-vv-name="title" required data-vv-scope="form2"
                              >
                              </v-text-field>
                              <span class="help is-danger">{{ vErrors.first('title') }}</span>
                            <v-textarea label="Note" v-model="newpost.note">
                              <div slot="label">
                                Note <small>(Optional)</small>
                              </div>
                            </v-textarea>

                          <v-btn color="error" @click="$emit('close')">Cancel</v-btn>
                          <v-btn flat @click.native="goBack()">Previous</v-btn>
                          <v-btn color="primary" @click.native="submitForm('form2')">Continue</v-btn>

                        </form>
                        </v-stepper-content>
                        <v-stepper-content step="3">
                          <form data-vv-scope="form3">

                            <span><h3>Please either choose a image from Google Places, or input a custom image URL</h3></span>
                            <v-text-field
                              label="Photo URL (Optional)"
                              v-validate="'url:require_protocol'"
                              :error-messages="vErrors.first('photo_url')"
                              data-vv-name="photo_url" data-vv-scope="form3"
                              v-model="newpost.photo_url"
                            ></v-text-field>
                            <v-layout>
                              <v-flex xs12 xl6 offset-md3>
                                <v-card>
                                  <v-container grid-list-sm align-content-centered="true" fluid>
                                    <v-layout row wrap>
                                      <v-flex
                                        v-for="n in 6"
                                        :key="n"
                                        xs4
                                        d-flex
                                      >
                                        <v-card flat tile class="d-flex">
                                          <v-img
                                            :src= photos[n]
                                            @click.native="savePhoto(n)"
                                            aspect-ratio="1"
                                            class="grey lighten-2 pointer"
                                          >
                                            <v-layout
                                              slot="placeholder"
                                              fill-height
                                              align-center
                                              justify-center
                                              ma-0
                                            >
                                              <v-progress-circular indeterminate color="grey lighten-5"></v-progress-circular>
                                            </v-layout>
                                          </v-img>
                                        </v-card>
                                      </v-flex>
                                    </v-layout>
                                  </v-container>
                                </v-card>
                              </v-flex>
                            </v-layout>

                          <v-btn color="error" @click="$emit('close')">Cancel</v-btn>
                          <v-btn flat @click.native="getPhotos()">Previous</v-btn>
                          <v-btn color="primary" @click.native="submitForm('form2')">Continue</v-btn>

                        </form>
                        </v-stepper-content>
                        <v-stepper-content step="4">
                          <form data-vv-scope="form4">

                          <v-combobox
                            v-model="newpost.boards"
                            :items="boards"
                            item-text="name"
                            :search-input.sync="search"
                            v-validate="'required'"
                            :error-messages="vErrors.first('boards')"
                            data-vv-name="boards" required data-vv-scope="form3"
                            hide-selected
                            label="Choose your boards or type to create a new one"
                            multiple
                            chips
                            deletable-chips
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
                            v-validate="'required'"
                            :error-messages="vErrors.first('categories')"
                            data-vv-name="categories" required data-vv-scope="form3"
                            label="Choose your categories"
                            multiple
                            chips
                            deletable-chips
                          ></v-select>

                          <v-btn color="error" @click="$emit('close')">Cancel</v-btn>
                          <v-btn flat @click.native="goBack()">Previous</v-btn>
                          <v-btn color="primary" @click="$emit('close')" @click.prevent="submit">Save</v-btn>

                        </form>
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
    document.addEventListener("keydown", (enter) => {
      if (enter.keycode == 13) {

      }
    });
  },

  data: () => ({
    e1: 0,
    step: 1,
    errors: [],
    photos: {},
    newpost: {
      title: null,
      note: null,
      location: null,
      photo_url: null,
      city: null,
      board: null,
      categories: null,
    },
    search: null,
    address: this.address,

    modalContainer: {
      maxWidth: '822px',
      boxShadow: '3px 0px 5px 0px rgba(0,0,0,0.75)',
      margin: '0 auto',
      top: '100px',
      padding: '33px',
      borderRadius: '6px'

    }
  }),

  created() {
    axios.get(`http://localhost:3000/posts/`, {
    })
      .then((response) => {
        this.categories = response.data.categories;
        this.boards = response.data.boards.filter(obj => {
          return obj.user_id === 2
        });
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
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
  methods: {

    submitForm(scope) {
      this.$validator.validateAll(scope).then(result => {
        if (result && scope === "form2") {
          this.e1++;
          for (let i=0; i<8; i++) {
            this.photos[i] = this.address.photos[i].getUrl();
          }
          return this.photos;
        }
        else if (result) {
          this.e1++;
        }
      });
    },
    goBack(){
      this.e1--
    },
    /**
    * When the location found
    * @param {Object} addressData Data of the found location
    * @param {Object} placeResultData PlaceResult object
    * @param {String} id Input container ID
    */
    getAddressData: function (placeResultData) {
      this.address = placeResultData;
    },

    savePhoto(n) {
      this.newpost.photo_url = this.photos[n]
    },

    // getPhotos() {
    //   const photos = {}
    //   for (let i=0; i<8; i++) {
    //     photos[i] = this.address.photos[i].getUrl()
    //   }
    //   console.log(photos);
    //   return photos
    // },

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

      axios.post('http://localhost:3000/posts/', submitPost)
        .then((response) => {
          this.newpost = response.data;
        })
        .catch((error) => {
          this.errors.push(error);
          console.log(this.errors);
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
  height: 1000px
  background-color: rgba(0, 0, 0, .5)
  display: table
  transition: opacity .3s ease

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

.modal-enter
  opacity: 0

.modal-leave-active
  opacity: 0

.pointer
  cursor: pointer

</style>
