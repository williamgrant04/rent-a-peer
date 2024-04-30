Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  devise_for :users
  resources :user_services, only: %i[new create destroy] do
    resources :reviews, only: %i[new create destroy]
  end
  resources :services, only: %i[index show]
end
