Rails.application.routes.draw do
  root to: 'articles#wall'
  namespace :admin do
    get 'users/index'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  devise_scope :user do
    get 'signin' => 'users/sessions#new'
  end

  namespace :admin do
    resources :users
    resources :registries, only: %i[index]
  end

  resources :orders
  resources :products
  resources :reports, only: %i[index]

  resources :registries, only: %i[new create]

  resources :articles
  get 'wall' => 'articles#wall'
  get "page/:page" => "page#show"

  namespace :api do
    namespace :v1 do
      resources :articles, only: %i[index]
      resources :products, only: %i[index]
    end
  end
end
