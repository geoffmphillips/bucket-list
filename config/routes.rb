Rails.application.routes.draw do

  resources :boards
  resources :posts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
end
