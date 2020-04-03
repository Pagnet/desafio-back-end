# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: :index
  resources :cnab_files, only: %i[new create]
  resources :stores, only: %i[index show]
end
