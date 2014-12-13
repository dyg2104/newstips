Rails.application.routes.draw do

  root 'tips#new'
  get 'dashboard', to: 'pages#dashboard'

  resource :user
  resource :session
  resources :tips

  namespace :api, defaults: { format: :json } do
    resources :tips, only: :index
    resources :user_saves, only: [:create, :destroy]
    resources :user_views, only: :create
  end

end
