import Vue from 'vue';
import Router from 'vue-router';
import CardContainer from '@/components/cards/CardContainer';
import Users from '@/components/Users';
import Post from '@/components/Post';

Vue.use(Router);

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
  ],
});
