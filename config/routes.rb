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
  get "/rooms/:id" => "rooms#talk"
  get "/friend/:id" => "rooms#friend_detail"
  
  get "/" => "users#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
