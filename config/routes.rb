Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :transactions, only: %i[new index create]

  root 'transactions#index'
end
