Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"

  get "/group/:id", to: "group#index", as: "group"

  get "/admin", to: "admin#index"
  post "/admin", to: "admin#create", as: "new_group"
  get "/admin/group/:id", to: "admin#group", as: "admin_group"
  post "/admin/group", to: "admin#add_mem", as: "new_member"
  post "/admin/kick", to: "admin#kick_mem", as: "kick_mem"
end
