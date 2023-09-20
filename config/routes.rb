Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events
  post "/events/:event_id", to: "rsvps#create"

  root "events#index"
end
