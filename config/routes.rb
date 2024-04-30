Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  devise_for :users
  resources :user_services, only: %i[new create destroy]
  resources :services, only: %i[index show]
  get "profile", to: "users#show"
  get "banner-partial", to: "users#banner"
end
