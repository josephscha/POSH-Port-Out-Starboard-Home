Rails.application.routes.draw do
  get "/", to: 'collectors#welcome', as: "home"
  resources :artists, only: [:create, :show, :index]
  resources :object_types, only: [:create, :show, :index]
  resources :artworks
  resources :collectors, except: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
