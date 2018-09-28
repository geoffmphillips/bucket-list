import axios from 'axios';

export default {
  state: {
    isLoggedIn: false,
    user: '',
    isSessionReady: false,
  },

  getters: {
    isLoggedIn: (state) => { 
      return state.isLoggedIn;
    },
    jwt: (state) => { 
      return state.currentJWT;
    },
    user: (state) => { 
      return state.user;
    },
  },

  mutations: {
    setJWT(state, jwt) {
      // When this updates, the getters and anything bound to them updates as well.
      state.user = jwt;
      state.isLoggedIn = true;
    },
    removeJWT(state) {
      state.user = '';
      state.isLoggedIn = false;
    },
    sessionReady(state) {
      state.isSessionReady = true;
    }
  },

  actions: {
    setupSession({ commit }) {
      let token = localStorage.getItem('jwt');
      if (token) {
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      }
      commit('sessionReady');
    },

    logIn({ commit, state }, token) {
      // Calls the mutation defined to update the state's JWT.
      localStorage.setItem('jwt', token);
      localStorage.signedIn = true;

      if (token) {
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      }

      commit('setJWT', { jwt: token });
    },
    logOut({ commit }) {
      localStorage.removeItem('jwt');
      localStorage.signedIn = false;
      commit('removeJWT');
    },
  },
};
