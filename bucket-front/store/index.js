import Vue from 'vue';
import Vuex from 'vuex';

const LOGIN = 'LOGIN';
const LOGIN_SUCCESS = 'LOGIN_SUCCESS';
const LOGOUT = 'LOGOUT';

Vue.use(Vuex);


export default new Vuex.Store({
  modules: {
  },
  state: {
    isLoggedIn: !!localStorage.getItem('token'),
  },
  getters: {
    isLoggedIn: state => {
      return state.isLoggedIn,
    }
  },
  mutations: {
    [LOGIN](state) {
      state.pending = true;
    },
    [LOGIN_SUCCESS](state) {
      state.isLoggedIn = true;
      state.pending = false;
    },
    [LOGOUT](state) {
      state.isLoggedIn = false;
    },
  },
  actions: {
    login({ commit }, creds) {
      commit(LOGIN); // show spinner
      return new Promise((resolve) => {
        setTimeout(() => {
          localStorage.setItem('token', 'JWT');
          commit(LOGIN_SUCCESS);
          resolve();
        }, 1000);
      });
    },
    logout({ commit }) {
      localStorage.removeItem("token");
      commit(LOGOUT);
    }
  }
});
