Rails.application.routes.draw do
  resources :transactions, only: [:index]
  resources :cnab_files do
    post :import, on: :collection
  end

  root 'transactions#index'
end
