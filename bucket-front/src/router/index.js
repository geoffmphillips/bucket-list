import Vue from 'vue';
import Router from 'vue-router';
import Vuetify from 'vuetify';

import routes from './routes';

Vue.use(Router);
Vue.use(Vuetify);

export default new Router({
  routes,
});

