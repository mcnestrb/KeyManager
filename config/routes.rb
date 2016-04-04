Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  post "/", to: "home#create"
  get "/", to: "home#index"
end
