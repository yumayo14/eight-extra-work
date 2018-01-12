Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'search'
    end
  end
  resources :companies
  resources :landings, only: :index
  root "landings#index"
end
