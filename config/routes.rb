Rails.application.routes.draw do
  namespace :platform do
    resources :importers, only: [:index, :new, :create]
    resources :stores, only: [:index, :show] do
      resources :operations, only: :index, module: :stores
    end
  end
end
