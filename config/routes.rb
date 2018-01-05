Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :companies
  resources :landings, only: :index
  root "landings#index"
end
