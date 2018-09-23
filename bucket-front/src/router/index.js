import Vue from 'vue';
import Router from 'vue-router';
import Vuetify from 'vuetify';
import HelloWorld from '@/components/HelloWorld';
import Users from '@/components/Users';
import CardContainer from '@/components/cards/CardContainer';
import Users from '@/components/Users';
import Post from '@/components/Post';
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
      path: '/newpost',
      name: 'NewPost',
      component: NewPost,
    },
  ],
});
