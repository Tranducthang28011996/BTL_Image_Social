Rails.application.routes.draw do

  root "photos#index"
  resources :photos do
    resources :comments, only: [:create, :update, :destroy]
  end

  devise_for :users, path: "", path_names: {
    sign_up: "register",
    sign_in: "login",
    sign_out: "logout"
  }
end
