Rails.application.routes.draw do
  resources :ratings
  root "ratings#new"
end
