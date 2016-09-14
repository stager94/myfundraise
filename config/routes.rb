Rails.application.routes.draw do
  get 'campaigns/create'

  get 'users/finish_signup'

  get 'categories/show'

  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  
  resources :categories, only: [:show]
  resources :users

  namespace :dashboard do
    resources :campaigns, param: :campaign_id do
      member do
        resources :campaign_steps, path: :steps
      end
    end
    resources :users, only: :show do
      get :vk_photos, on: :member
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: :show do
        get :vk_photos, on: :member
      end
    end
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup


end
