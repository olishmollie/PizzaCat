Rails.application.routes.draw do
  get 'welcome/index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  resources :users, only: [:create, :show, :destroy] do
    resources :ratings
    resources :restaurants, only: [:show, :index]
  end
  resource :restaurants, only: [:index]
  root 'welcome#index'
end