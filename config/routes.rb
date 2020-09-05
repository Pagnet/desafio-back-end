Rails.application.routes.draw do
  namespace :platform do
    resources :importers, only: [:index, :new, :create]
    resources :stores, only: [:index, :show]
  end
end
