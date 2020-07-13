require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  post '/' => 'home#index', as: :file_upload

  root to: 'home#index'
end