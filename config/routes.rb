Rails.application.routes.draw do
  root 'transactions#new'
  get 'transactions/new', to: 'transactions#new', as: 'transactions'
  post 'transactions/new', to: 'transactions#create', as: 'transactions_new'
  get :transactions, to: 'transactions#index', as: 'transactions_list'
  get :stores, to: 'stores#index', as: 'stores_list'
  get 'stores/:id/transactions', to: 'stores#transactions', as: 'store_transactions'
end
