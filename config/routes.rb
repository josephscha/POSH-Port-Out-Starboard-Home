Rails.application.routes.draw do
  
  resources :likes
  # resources :sessions
  resources :artists, only: [:create, :show, :index]
  resources :object_types, only: [:create, :show, :index]
  resources :artworks
  resources :users, except: :destroy
  get "/sessions/login", to: 'sessions#new', as: "login"
  # get '/sessions/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
