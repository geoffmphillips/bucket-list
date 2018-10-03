Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :boards
  resources :posts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :categories
  resources :locations, only: [:index, :show]
  resources :comments
  resources :board_items, only: [:index]
end
