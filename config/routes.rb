Rails.application.routes.draw do
  resources :importacaos
  resources :lojas
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/saldo/(:cpf)', to: 'lojas#saldo'   
  root "lojas#index" 
end
