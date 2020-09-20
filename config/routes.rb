require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'attached_files#index'
  resources :attached_files, only: [:index, :create]
  resources :shopkeepers, only: [:index] do
    resources :negotiations, only: :index
  end
end
