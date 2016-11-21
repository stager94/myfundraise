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

  post '/tinymce_assets' => 'tinymce_assets#create'

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
    match 'campaigns/:campaign_id/select_picture' => 'campaigns#select_picture', as: :select_campaign_picture, via: [:post, :patch]
    match 'campaigns/:campaign_id/select_video' => 'campaigns#select_video', as: :select_campaign_video, via: [:post, :patch]

    resources :notifications, only: :index
    resources :comments, only: :index
    resources :donations, only: :index

    resources :campaigns, param: :campaign_id do

      patch :crop, on: :member
      post :activate, on: :member
      post :post_update, on: :member

      member do
        resources :campaign_steps, path: :steps

        get :next_step, :prev_step
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
