Rails.application.routes.draw do
  resources :cnab_files, only: %i[new create]
  resources :stores, only: %i[index show]

  root to: 'cnab_files#new'
end
