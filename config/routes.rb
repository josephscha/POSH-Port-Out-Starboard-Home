Rails.application.routes.draw do
  
resources :artists, only: [:create, :show, :index]
  resources :object_types, only: [:create, :show, :index]
  resources :artworks
  resources :users, except: :destroy
  get "/", to: 'users#welcome', as: "home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
