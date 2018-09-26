import Vue from 'vue';
import Router from 'vue-router';
<<<<<<< HEAD
=======
import Vuetify from 'vuetify';
import CardContainer from '@/components/cards/CardContainer';
>>>>>>> 3375973243a2ec039d3aa3baf5c88400bce05dba
import Users from '@/components/Users';
import Post from '@/components/Post';
import TheLocations from '@/components/TheLocations';
import TheLocation from '@/components/TheLocation';
import TheCategories from '@/components/TheCategories';
import TheCategory from '@/components/TheCategory';
import NewPost from '@/components/NewPost';

Vue.use(Router);
Vue.use(Vuetify);

export default new Router({
  routes: [
    {
<<<<<<< HEAD
=======
      path: '/',
      name: 'CardContainer',
      component: CardContainer,
    },
    {
>>>>>>> 3375973243a2ec039d3aa3baf5c88400bce05dba
      path: '/users',
      name: 'Users',
      component: Users,
    },
    {
      path: '/posts/:id',
      name: 'Post',
      component: Post,
    },
    {
      path: '/locations',
      name: 'TheLocations',
      component: TheLocations,
    },
    {
      path: '/locations/:id',
      name: 'TheLocation',
      component: TheLocation,
    },
    {
      path: '/categories',
      name: 'TheCategories',
      component: TheCategories,
    },
    {
      path: '/categories/:id',
      name: 'TheCategory',
      component: TheCategory,
    },
    {
      path: '/newpost',
      name: 'NewPost',
      component: NewPost,
    },
  ],
});
