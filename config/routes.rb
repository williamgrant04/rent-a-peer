Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/create'
  get 'articles/destroy'
  devise_for :users
end
