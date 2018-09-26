import Vue from 'vue';
import Router from 'vue-router';
import Users from '@/components/Users';
import UserProfile from '@/components/UserProfile';
import Login from '@/components/Login';
import Boards from '@/components/Boards';

import Vuetify from 'vuetify';
import CardContainer from '@/components/cards/CardContainer';
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
      path: '/',
      name: 'CardContainer',
      component: CardContainer,
    },
    {
      path: '/users',
      name: 'Users',
      component: Users,
    },
    {
      path: '/users/:id',
      name: 'UserProfile',
      component: UserProfile,
    },
    {
      path: '/login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/boards',
      name: 'Boards',
      component: Boards,
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
    // otherwise redirect to home
    { path: '*', redirect: '/' },
  ],
});

