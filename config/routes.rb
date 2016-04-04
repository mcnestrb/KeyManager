Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"

  get "/group/:id", to: "group#index"
end
