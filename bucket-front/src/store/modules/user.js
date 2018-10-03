import axios from 'axios';

export default {
  state: {
    isLoggedIn: false,
    token: '',
    username: '',
    isSessionReady: false,
  },

  mutations: {
    setJWT(state, jwt) {
      // When this updates, the getters and anything bound to them updates as well.
      state.token = jwt;
      state.isLoggedIn = true;
    },
    removeJWT(state) {
      state.user = '';
      state.isLoggedIn = false;
    },
    sessionReady(state) {
      state.isSessionReady = true;
    },
    setUser(state, user) {
      state.username = user;
    },
  },

  actions: {
    setupSession({ commit }) {
      const token = localStorage.getItem('jwt');
      if (token) {
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
        commit('setJWT', token);
        axios.get('http://localhost:3000/users/1')
          .then((response) => {
            commit('setUser', response.data.user.first_name);
          });
      }
      commit('sessionReady');
    },

    logIn({ commit, state }, token) {
      // Calls the mutation defined to update the state's JWT.
      localStorage.setItem('jwt', token);
      localStorage.signedIn = true;
      console.log('User state localstorage: ', localStorage);

      if (token) {
        axios.defaults.headers.common.Authorization = `Bearer ${token}`;
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
