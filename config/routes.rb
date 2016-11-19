Rails.application.routes.draw do
  get 'welcome/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  resources :users, only: [:create, :show, :destroy]
  resources :restaurants
  resources :ratings
  
  root 'welcome#index'
  
end
