import Vue from 'vue';
import Router from 'vue-router';
import Vuetify from 'vuetify';
import HelloWorld from '@/components/HelloWorld';
import Users from '@/components/Users';
import NewPost from '@/components/NewPost';

Vue.use(Router);
Vue.use(Vuetify);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld,
    },
    {
      path: '/users',
      name: 'Users',
      component: Users,
    },
    {
      path: '/newpost',
      name: 'NewPost',
      component: NewPost,
    },
  ],
});
