require "sidekiq/web"
Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  resources :account_transactions, only: [:index, :show]
  resources :cnab_imports, only: [:index, :new, :create]

  root to: "account_transactions#index"
end
