Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'search'
    end
    member do
      get :profile
    end
    resources :academies
    resources :cards
    resources :careers
    resources :companies
  end
  resources :landings, only: :index
  root "landings#index"
end
