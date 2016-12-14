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

  get '/how_it_works' => 'static#how_it_works', as: :how_it_works
  get '/pricing' => 'static#pricing', as: :pricing
  get '/questions' => 'static#questions', as: :questions
  match '/send_question' => 'static#send_question', as: :send_question, via: [:get, :post]
  get '/privacy_policy' => 'static#privacy_policy', as: :privacy_policy
  get '/terms_of_use' => 'static#terms_of_use', as: :terms_of_use

  resources :categories, only: [:show]
  resources :users do
    get :withdraws, on: :collection
  end
  resources :custom_questions
  resources :withdraws

  namespace :blog do
    resources :articles, only: [:index, :show] do
      resources :likes, only: [:create], on: :member
      resources :comments, only: [:create, :index], on: :member
    end
  end

  resources :campaigns do
    member do
      resources :donations do
        get :load_more, on: :collection
      end
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

      resources :rewards

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
