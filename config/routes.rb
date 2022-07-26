Rails.application.routes.draw do
  # Root path
  root :to => "sessions#create"
  
  # Sessions routes
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  
  # Users routes
  post "/signup" => "users#create"
  
  # Properties routes
  resources :properties, only: [:index, :show, :create, :update, :destroy]

  # Status routes
  resources :statuses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
