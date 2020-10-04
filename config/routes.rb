Rails.application.routes.draw do
  resources :transactions, only: %i[new index create]

  root 'transactions#index'
end
