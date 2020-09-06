Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :platform do
    resources :importers, only: [:index, :new, :create]
    resources :stores, only: [:index, :show] do
      resources :operations, only: :index, module: :stores
    end

    root 'importers#index'
  end

  root 'home#index'
end
