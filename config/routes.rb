require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  authenticate :user do
    resources :stores
  end
end
