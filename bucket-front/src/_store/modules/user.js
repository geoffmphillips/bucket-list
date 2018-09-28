import axios from 'axios';

export default {
  state: {
    isLoggedIn: false,
    currentJWT: '',
    isSessionReady: false,
  },

  getters: {
    isLoggedIn: (state) => { state.isLoggedIn; },
    jwt: (state) => { state.currentJWT; },
  },

  mutations: {
    setJWT(state, jwt) {
      // When this updates, the getters and anything bound to them updates as well.
      state.currentJWT = jwt;
      state.isLoggedIn = true;
    },
    removeJWT(state) {
      state.currentJWT = '';
      state.isLoggedIn = false;
    },
    sessionReady(state) {
      state.isSessionReady = true;
    },
  },

  actions: {
    setupSession({ commit }) {
      const token = localStorage.getItem('jwt');
      if (token) {
        axios.defaults.headers.common.Authorization = `Bearer ${token}`;
      }
      commit('sessionReady');
    },

    logIn({ commit, state }, token) {
      // Calls the mutation defined to update the state's JWT.
      localStorage.setItem('jwt', token);
      localStorage.signedIn = true;

      if (token) {
        axios.defaults.headers.common.Authorization = `Bearer ${token}`;
      }

      commit('setJWT', { jwt: token });
    },
    logOut({ commit }) {
      commit('removeJWT');
    },
  },
};
