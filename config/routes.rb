Rails.application.routes.draw do
  get "/signup" => "users#signup"
  post "/users/create" => "users#create"
  get "/login" => "users#index"
  post "/login" => "users#login"
  post "/login/sms_auth/:id" => "users#sms_auth"
  get "/login/:id" => "users#sms"
  get "/rooms/show" => "rooms#show"
  get "/rooms/friends" => "rooms#friends"
  get "/" => "users#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
