Rails.application.routes.draw do

  mount WalletoneMiddleware.new => '/w1_callback'

  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { 
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  resources :categories, only: [:show]
  resources :users
  
  resources :campaigns do
    member do
      resources :donations
    end
    resources :likes, only: [:create], on: :member
    resources :comments, only: [:create, :index], on: :member
  end
  resources :comments do
    resources :likes, on: :member
  end

  namespace :dashboard do
    post 'campaigns/:campaign_id/select_picture' => 'campaigns#select_picture', as: :select_campaign_picture

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


      get 'cities/search' => 'cities#search', as: :search_cities
    end
  end

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  post '/donations/check' => 'donations#check', as: :check_payment

end
