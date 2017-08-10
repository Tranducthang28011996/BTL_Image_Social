Rails.application.routes.draw do

  root "photos#index"
  resources :photos do
    resources :comments, only: [:create, :update, :destroy]
  end

  resources :users

  post "follow/:id", to: "follows#create", as: "follow"
  delete "unfollow/:id", to: "follows#destroy", as: "unfollow"

  devise_for :users, path: "", path_names: {
    sign_up: "register",
    sign_in: "login",
    sign_out: "logout"
  }

  namespace :admin do 
    root "photos#index"
  end
end
