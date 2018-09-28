import Vue from 'vue';
import Vuex from 'vuex';

import user from './modules/user';
import alert from './modules/alert';
import mapStyle from './modules/mapStyle';
import authentication from './modules/authentication';
import common from './modules/common';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    alert,
    authentication,
    common,
    mapStyle,
    user,
  },
});
