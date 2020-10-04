Rails.application.routes.draw do
  devise_for :users
  resources :transactions, only: %i[new index create]

  root 'transactions#index'
end
