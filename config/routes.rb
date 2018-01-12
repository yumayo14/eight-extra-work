Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'search'
    end
    resources :academies
    resources :careers
    resources :companies
  end
  resources :landings, only: :index
  root "landings#index"
end
