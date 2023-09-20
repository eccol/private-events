Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events do
    # post "/events/:event_id/rsvp", to: "rsvps#create"
    resources :rsvps
  end
  # post "/events/:event_id", to: "rsvps#create"
  # delete "/events/:event_id", to: "rsvps#destroy"

  root "events#index"
end
