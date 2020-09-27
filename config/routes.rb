Rails.application.routes.draw do
  root 'store_operations#new'

  resources :stores, only: :index
  resources :store_operations, only: [:create, :index, :new]
end
