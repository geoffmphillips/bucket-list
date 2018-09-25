import Vue from 'vue';
import * as VueGoogleMaps from 'vue2-google-maps';
import Vuetify from 'vuetify';
import VuetifyGoogleAutocomplete from 'vuetify-google-autocomplete';
import App from './App';
import router from './router';
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

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>',
});
