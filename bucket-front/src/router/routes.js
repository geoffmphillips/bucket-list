import Login from '@/components/Login';
import CardContainer from '@/components/cards/CardContainer';
import UserProfile from '@/components/UserProfile';
import Post from '@/components/layouts/Post';
import NewPost from '@/components/NewPost';
import TheLocations from '@/components/layouts/TheLocations';
import TheLocation from '@/components/layouts/TheLocation';
import TheCategories from '@/components/layouts/TheCategories';
import TheCategory from '@/components/layouts/TheCategory';
import TheBoards from '@/components/layouts/TheBoards';
import TheBoard from '@/components/layouts/TheBoard';
import Registration from '@/components/Registration';

export default [
  {
    path: '/',
    name: 'CardContainer',
    component: CardContainer,
  },
  {
    path: '/profile',
    name: 'UserProfile',
    component: UserProfile,
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/register',
    name: 'Register',
    component: Registration,
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
    path: '/boards/:id',
    name: 'TheBoard',
    component: TheBoard,
  },
  {
    path: '/boards',
    name: 'TheBoards',
    component: TheBoards,
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
];
