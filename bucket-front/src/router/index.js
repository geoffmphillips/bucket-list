import Vue from 'vue';
import Router from 'vue-router';
import HelloWorld from '@/components/HelloWorld';
import Users from '@/components/Users';

Vue.use(Router);

export default new Router({
  routes: [

    {
      path: '/users',
      name: 'Users',
      component: Users,
    },
  ],
});
