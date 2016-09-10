Rails.application.routes.draw do
  get 'categories/show'

  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :categories, only: [:show]


end
