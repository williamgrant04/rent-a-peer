Rails.application.routes.draw do
  root to: 'services#index'
  devise_for :users
  resources :user_services, only: %i[new create destroy] do
    resources :reviews, only: %i[new create destroy]
  end

  resources :services, only: %i[show] do
    resources :listings, only: %i[new create show] do
      resources :bookings, only: %i[show new create edit update] # Should be nested in listings
    end
  end

  get "profile", to: "users#profile"
  get "user/:id/profile", to: "users#show", as: :user_profile
  get "banner-partial", to: "users#banner"
  resources :bookings, only: %i[destroy]
end
