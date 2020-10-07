Rails.application.routes.draw do
  resources :cnab_imports, only: [:index, :new, :create]
end
