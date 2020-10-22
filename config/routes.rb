Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {sessions: "sessions"}
  resources :articles do
    resources :comments
    resources :likes
  end
  get 'home/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
