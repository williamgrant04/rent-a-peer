Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  devise_for :users
  resources :user_services, only: %i[new create destroy]
end
