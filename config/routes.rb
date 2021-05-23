Rails.application.routes.draw do
  get 'static/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :campaigns, only: [:index]
    resources :characters, only: [:index, :show, :edit, :update]
  end

  resources :campaigns do
    resources :sessions, controller: :seshion #create new controller with changed spelling to not conflict with SessionsController for user sessions
    resources :characters
  end
end
