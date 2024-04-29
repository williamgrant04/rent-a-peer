Rails.application.routes.draw do
  get 'user_services/new'
  get 'user_services/create'
  get 'user_services/destroy'
  get 'articles/new'
  get 'articles/create'
  get 'articles/destroy'
  devise_for :users
end
