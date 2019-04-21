Rails.application.routes.draw do

  root to: "static#home"
  devise_for :users
  get "/find-friends", to: "users#index", as: "findfriends"


   resources :friend_requests, only: [:create, :destroy]
   resources :likes, only: [:create, :destroy]
   resources :users, only: [:show]
   resources :friendships, only: [:create, :destroy]
   resources :notifications, only: [:create] do
	   member do
	        patch :make_read
	        put :make_read
	    end
	end
	resources :posts, only: [:create, :edit, :update, :destroy]
  resources :comments, only: [:create]
end
