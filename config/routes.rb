Rails.application.routes.draw do
  get 'welcome/index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  resources :users do
    resources :ratings, only: [:index]
    resources :restaurants, only: [:index, :show] do
      resources :ratings
    end
  end
  resources :restaurants, only: [:index, :show]
  root 'welcome#index'
end