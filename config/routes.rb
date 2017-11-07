Rails.application.routes.draw do
  resources :synopses
  resources :duties
  resources :panels
  get 'guideallot/allotment'
resources :guideallots, only: [:update]
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
  get '/project_corner', to: "visitors#student"
  get '/guide', to: "visitors#teacher"
  get '/coordinator', to: "visitors#coordinator"
  devise_for :users
  resources :users
end
