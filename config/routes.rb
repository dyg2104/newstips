Rails.application.routes.draw do

  root 'tips#new'
  get 'dashboard', to: 'pages#dashboard'

  resource :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :tips, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    resources :tips, only: :index
    resources :related_articles, only: :index
    resources :user_saves, only: [:create, :destroy]
    resources :user_views, only: :create
  end

end
