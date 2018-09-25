import Vue from 'vue';
import Router from 'vue-router';
import Users from '@/components/Users';
import UserProfile from '@/components/UserProfile';
import Login from '@/components/Login';
import Boards from '@/components/Boards';


Vue.use(Router);

export default new Router({
  routes: [
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
    // otherwise redirect to home
    { path: '*', redirect: '/' },
  ],
});

