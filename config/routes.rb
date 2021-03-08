# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'home#index'
  post 'upload', controller: 'home', action: 'upload'
  resources :transactions, only: [:index]
end
