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
    resources :messages
    resources :posts, only: [:index, :create, :destroy]
  end
  resources :landings, only: :index
  resources :relationships, only: [:create, :destroy]
  root "landings#index"
end
