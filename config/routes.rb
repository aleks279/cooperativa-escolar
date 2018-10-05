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
    resources :articles
  end

  resources :orders
  resources :products
  resources :registries, only: %i[new create]
  resources :articles
  get 'wall' => 'articles#wall'
  get "page/:page" => "page#show"
end
