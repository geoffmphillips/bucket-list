import Vue from 'vue';
import * as VueGoogleMaps from 'vue2-google-maps';
import VuetifyGoogleAutocomplete from 'vuetify-google-autocomplete';
import VueAxios from 'vue-axios';
import axios from 'axios';
import { sync } from 'vuex-router-sync';
import Vuetify from 'vuetify';
import VeeValidate from 'vee-validate';
import Autocomplete from 'v-autocomplete';

import App from './App';
import router from './router';
import Navbar from './components/Navbar';
import store from './store/index';
import NewPost from './components/NewPost';

Vue.use(VueAxios, axios);
Vue.use(Autocomplete);

Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyCqC3YhZScKNM541GdXrJ4FXFU0tluWtgQ',
    libraries: 'places,drawing',
  },
});

Vue.config.productionTip = false;
Vue.use(Vuetify, {
  theme: {
    primary: '#21CE99',
    secondary: '#D81B60',
    accent: '#805441',
  },
});
Vue.use(VeeValidate, { errorBagName: 'vErrors' });
Vue.use(VuetifyGoogleAutocomplete, {
  apiKey: 'AIzaSyC1I4rc72v5cAK3VPLXYKLnUmISNzM5AYs',
});

// Polyfills
global.URLSearchParams = URLSearchParams;

// Sync router to store, as `store.state.route`.
sync(store, router);

// Styles
require('./styles/stylus/main.styl');

// Global Components
Vue.component('Navbar', Navbar);
Vue.component('NewPost', NewPost);

/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: h => h(App),
  router,
  axios,
  store,
  components: { App },
  template: '<App/>',
});
