Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"

  post "/upload", to: "home#upload"
end
