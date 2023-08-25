Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/wishlist", to: "pages#wishlist", as: :wishlist
  get "/messages", to: "pages#messages", as: :messages
  get "/payment-methods", to: "pages#payment_methods", as: :payment_methods
  get "/boats/map", to: "boats#map", as: :map
  get "/map", to: "pages#map", as: :home_map
  patch "/bookings/:id/accept", to: "bookings#accept", as: "accept"
  patch "/bookings/:id/reject", to: "bookings#reject", as: "reject"

  resources :boats, only: %i[index show new create edit update] do
    resources :crew_members
    resources :bookings, only: %i[new create]
  end

  resources :listings

  resources :wishlists, only: %i[create destroy]

  resources :bookings, only: %i[index show destroy] do
    resources :reviews, only: %i[new create]
  end

  resources :users, only: %i[show edit update destroy]
end
