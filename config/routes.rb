Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard do
    resources :boats do
      resources :crew_members
    end
    resources :bookings
    resources :reviews, only: [:index, :show]
  end

  resources :boats do
    resources :crew_members
  end

  resources :bookings, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
  resources :users, only: [:show, :edit, :update, :destroy]
end
