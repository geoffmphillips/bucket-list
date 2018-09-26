
export default {
  state: {
    isLoggedIn: false,
    currentJWT: '',
  },

  getters: {
    isLoggedIn: state => { state.isLoggedIn },
    jwt: state => { state.currentJWT },
    // jwtData: (state, getters) => state.currentJWT ? JSON.parse(atob(getters.jwt.split('.')[1])) : null,
    // jwtSubject: (state, getters) => getters.jwtData ? getters.jwtData.sub : null,
    // jwtIssuer: (state, getters) => getters.jwtData ? getters.jwtData.iss : null,
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
  },

  actions: {
    setStoreJWT({ commit, state }, token) {
      // Calls the mutation defined to update the state's JWT.
      commit('setJWT', { jwt: token });
    },
    removeStoreJWT({ commit }) {
      commit('removeJWT');
    },
  },
};
