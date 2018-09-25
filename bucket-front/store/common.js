const defaults = {
  sidebar: {
    visible: true
  },
};  

export default {
  namespaced: true,

  state: Object.assign({}, defaults),

  mutations: {
    updateSidebar (state, options) {
      state.sidebar = Object.assign({}, defaults.sidebar, options)
    },
    error (state, options) {
      state.error = Object.assign({}, defaults.error, options)
    },
    clear (state) {
      state = Object.assign({}, defaults)
    },
  },
  actions: {

    updateSidebar ({ commit }, options) {
      commit('updateSidebar', options)
    }
  }
}
