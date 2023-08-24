Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/wishlist", to: "pages#wishlist", as: :wishlist
  get "/messages", to: "pages#messages", as: :messages
  get "/map", to: "pages#map", as: :map
  get "/payment-methods", to: "pages#payment_methods", as: :payment_methods

  resources :boats, only: %i[index show new create edit update] do
    resources :crew_members
  end

  resources :listings

  resources :bookings, only: %i[index show new create destroy] do
    resources :reviews, only: %i[new create]
  end

  resources :users, only: %i[show edit update destroy]
end
