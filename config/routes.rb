require 'sidekiq/web'

Rails.application.routes.draw do
  root 'file_importeds#index'
  resources :file_importeds, only: %i[index new create destroy]

  mount Sidekiq::Web => '/sidekiq'
end
