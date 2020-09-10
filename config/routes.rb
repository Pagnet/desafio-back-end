Rails.application.routes.draw do
  devise_for :users
  root to: "importers#index"

  resources :importers, only: ["index", "new", "create"]
  resources :transactions, only: ["index"]
  resources :stores, only: ["index", "show"]
end
