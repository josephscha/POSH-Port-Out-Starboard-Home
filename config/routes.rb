Rails.application.routes.draw do
  
  post '/likes', to: 'likes#create', as: 'like'
  # resources :sessions
  resources :artists, only: [:create, :show, :index]
  resources :object_types, only: [:create, :show, :index]
  resources :artworks
  resources :users, except: :destroy
  get "/sessions/login", to: 'sessions#new', as: "login"
  # get '/sessions/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy'
end
