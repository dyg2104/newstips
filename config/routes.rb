Rails.application.routes.draw do

  root 'tips#new'
  get 'dashboard', to: 'pages#dashboard'

  resource :user, only: :create
  resource :session, only: [:create, :destroy]
  resources :tips, only: :create

  namespace :api, defaults: { format: :json } do
    resources :tips, only: :index
    resources :user_saves, only: [:create, :destroy]
    resources :user_views, only: :create
  end

end
