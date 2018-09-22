import Vue from 'vue';
import Router from 'vue-router';
import CardContainer from '@/components/cards/CardContainer';
import Users from '@/components/Users';

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
  ],
});
