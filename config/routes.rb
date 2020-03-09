Rails.application.routes.draw do
  # get 'favorites/create'
  # get 'favorites/destroy'
  devise_for :users
  root to: 'shops#index'
  resources :shops do
    resource :favorites, only: [:create, :show, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end