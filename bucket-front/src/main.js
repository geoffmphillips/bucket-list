// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import App from './App';
import Vuetify from 'vuetify'
import router from './router';
import store from '../store';
import { sync } from 'vuex-router-sync'

import Navbar from './components/Navbar';
import Sidebar from './components/Sidebar';

Vue.config.productionTip = false;

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

// // Styles
// require('./styles/scss/main.scss')
// require('./styles/stylus/main.styl')

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
