Rails.application.routes.draw do
  devise_for :users
  resources :user_services, only: %i[new create destroy]
end
