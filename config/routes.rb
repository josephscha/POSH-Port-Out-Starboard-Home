Rails.application.routes.draw do
  
  # resources :sessions
  resources :artists, only: [:create, :show, :index]
  resources :object_types, only: [:create, :show, :index]
  resources :users, except: :destroy
  resources :artworks
  patch '/artworks', to: 'artworks#buyit', as: "buy"
  get '/', to: 'sessions#welcome', as: 'home'
  get "/sessions/login", to: 'sessions#new', as: "login"
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy'
  post '/likes', to: 'likes#create', as: 'like'

  # get '/sessions/login', to: 'sessions#new'
end
