Rails.application.routes.draw do
  get "/signup" => "users#signup"
  post "/users/create" => "users#create"
  get "/login" => "users#index"
  post "/login" => "users#login"
  post "/login/sms_auth/:id" => "users#sms_auth"
  get "/login/:id" => "users#sms"
  get "/rooms/friends" => "rooms#friends"
  post "/rooms/friends/:id/append" => "rooms#append"
  post "/rooms/friends/:id/delete" => "rooms#delete"
  get "/rooms/talks" => "rooms#talks"
  get "/rooms/:id" => "rooms#talk"
  get "/friend/fix/" => "users#fix"
  get "/friend/add" => "users#add"
  post "/friend/add/search" => "users#search"
  post "friend/fix/allow/:id" => "users#allow"
  get "/friend/:id" => "rooms#friend_detail"
  get "/friend/fix/:id" => "users#fix_change"
  post "/friend/fix/:id" => "users#fix_run"
  get "/" => "users#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
