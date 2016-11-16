Rails.application.routes.draw do
  resources :user
  resources :restaurants
  resources :ratings
  root "ratings#new"
end
