import Vue from 'vue';
import Router from 'vue-router';
import Vuetify from 'vuetify';

import routes from './routes';

Vue.use(Router);
Vue.use(Vuetify);

export default new Router({
  routes,
});

// router.beforeEach((to, from, next) => {
//   // redirect to login page if not logged in and trying to access a restricted page
//   const restrictedPages = ['/newpost', '/userprofile'];
//   const authRequired = restrictedPages.includes(to.path);
//   const loggedIn = localStorage.getItem('jwt');

//   if (authRequired && !loggedIn) {
//     return next('/login');
//   }

//   next();
// });

// export default { router };
