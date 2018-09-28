import axios from 'axios';

import authHeader from '../_helpers';

function logout() {
  // remove user from local storage to log user out
  localStorage.removeItem('user');
}

function handleResponse(response) {
  return response.text().then((text) => {
    const data = text && JSON.parse(text);
    if (!response.ok) {
      if (response.status === 401) {
        // auto logout if 401 response returned from api
        logout();
        location.reload(true);
      }
      const error = (data && data.message) || response.statusText;
      return Promise.reject(error);
    }

    return data;
  });
}

function login(email, password) {
  const requestOptions = {
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ auth: { email, password } }),
  };

  return axios.post('http://localhost:3000/users_token', requestOptions)
    .then(handleResponse)
    .then((user) => {
      // login successful if there's a jwt token in the response
      if (user.token) {
        // store user details and jwt token in local storage
        // to keep user logged in between page refreshes
        localStorage.setItem('user', JSON.stringify(user));
      }
      return user;
    });
}

function getAll() {
  const requestOptions = {
    headers: authHeader(),
  };

  return axios.get('http://localhost:3000/users', requestOptions)
    .then(handleResponse);
}

export const userService = {
  login,
  logout,
  getAll,
};
