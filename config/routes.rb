Rails.application.routes.draw do
  resources :friendships
  #get 'friends/index'
  #get 'friends/destroy'
  
  #put 'friend_requests/:id', to: 'friend_request#update', :controller =>'friend_request', as: 'add_friend'
  namespace :admin do
    resources :users
    resources :friend_requests

    root to: "users#index"
  end

  resources :friend_requests
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
