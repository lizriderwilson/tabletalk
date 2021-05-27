Rails.application.routes.draw do

  # Homepage
  root 'static#index'

  # Sessions
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create_by_omniauth'

  resources :users do
    resources :campaigns, only: [:index, :new, :create, :edit, :destroy]
    resources :characters, only: [:index, :show, :edit, :update]
  end

  resources :campaigns, only: [:index, :show, :update] do
    resources :sessions, controller: :seshion #create new controller with changed spelling to not conflict with SessionsController for user sessions
    resources :characters
  end
end
