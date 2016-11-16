Rails.application.routes.draw do
  resources :users
  resources :restaurants
  resources :ratings
  root "ratings#new"
end
