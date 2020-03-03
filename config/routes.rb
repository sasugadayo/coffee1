Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'shops#index'
  resources :shops do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end