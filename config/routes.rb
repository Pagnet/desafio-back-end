Rails.application.routes.draw do
  resources :transactions, only: %i[index create]

  root 'transactions#index'
end
