require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'transactions#index'

  resources :transactions, only: %i[index] do
    post 'upload', to: 'transactions#upload', on: :collection
  end
end
