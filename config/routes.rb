Rails.application.routes.draw do

  root 'tips#new'
  get '/dashboard' => 'pages#dashboard'

  resource :user
  resource :session
  resources :tips

  namespace :api, defaults: { format: :json } do
    resources :tips
    resources :user_saves
    resources :user_views
  end

end
