Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  devise_scope :user do
    root to: 'users/sessions#new'
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

  get "page/:page" => "page#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
