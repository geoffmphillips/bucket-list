Rails.application.routes.draw do
  resources :boards
  resources :posts
  resources :users
  resources :categories
  resources :locations
end
