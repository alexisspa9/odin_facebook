Rails.application.routes.draw do

  root to: "static#home"
  devise_for :users
end