# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: :index
  resources :cnab_files, only: %i[new create]
end
