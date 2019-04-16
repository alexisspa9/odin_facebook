Rails.application.routes.draw do

  root to: "static#home"
  devise_for :users
  get "/find-friends", to: "users#index", as: "findfriends"


  resources :friend_requests, only: [:create, :destroy]
   resources :users, only: [:show]
   resources :friendships, only: [:create, :destroy]
end
