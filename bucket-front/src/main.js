import Vue from 'vue';
import * as VueGoogleMaps from 'vue2-google-maps';
import VuetifyGoogleAutocomplete from 'vuetify-google-autocomplete';
import App from './App';
import Vuetify from 'vuetify'
import router from './router';
import { sync } from 'vuex-router-sync'

import Navbar from './components/Navbar';
import Sidebar from './components/Sidebar';
import store from '../store/index';

Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyCqC3YhZScKNM541GdXrJ4FXFU0tluWtgQ',
    libraries: 'places,drawing',
  },
});

Vue.config.productionTip = false;
Vue.use(Vuetify);
Vue.use(VuetifyGoogleAutocomplete, {
  apiKey: 'AIzaSyC1I4rc72v5cAK3VPLXYKLnUmISNzM5AYs',
});

// Polyfills
global.URLSearchParams = URLSearchParams

// Sync router to store, as `store.state.route`.
sync(store, router)

Vue.use(Vuetify, {
  theme: {
    primary: '#21CE99',
    secondary: '#D81B60',
    accent: '#805441',
  }
})

// Styles
require('./styles/stylus/main.styl')

// Global Components
Vue.component('Navbar', Navbar)
Vue.component('Sidebar', Sidebar)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  render: h => h(App),
  router,
  store,
  components: { App },
  template: '<App/>',
});
