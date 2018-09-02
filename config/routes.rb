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
  end

  resources :orders
  resources :products

  get "page/:page" => "page#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
