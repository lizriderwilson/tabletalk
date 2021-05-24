Rails.application.routes.draw do

  # Homepage
  root 'static#index'

  # Sessions
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create'

  resources :users do
    resources :campaigns, only: [:index]
    resources :characters, only: [:index, :show, :edit, :update]
  end

  resources :campaigns do
    resources :sessions, controller: :seshion #create new controller with changed spelling to not conflict with SessionsController for user sessions
    resources :characters
  end
end
