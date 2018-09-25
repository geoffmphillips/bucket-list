Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  resources :boards
  resources :posts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
end
