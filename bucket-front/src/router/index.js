import Vue from 'vue';
import Router from 'vue-router';
import Vuetify from 'vuetify';
import CardContainer from '@/components/cards/CardContainer';
import Users from '@/components/Users';
import Post from '@/components/Post';
import TheLocations from '@/components/TheLocations';
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
