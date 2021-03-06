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
    collection do
      get 'gms'
      get 'players'
    end
    resources :campaigns, only: [:index, :new, :create, :edit, :destroy]
    resources :characters, only: [:index]
  end

  resources :campaigns, except: [:destroy] do
    resources :characters, except: [:index]
    resources :notes, module: :campaigns
    resources :seshions, path: 'sessions' do #Campaign_sessions renamed 'seshions' to not conflict with Sessions Controller, path and helper names overridden for clarity
      resources :notes, module: :seshions
    end
  end

  resources :notes, only: [:create, :edit, :update, :destroy]
end
