# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'
  get 'store/:id', to: 'store#show'
  post 'cnab/create'
end
