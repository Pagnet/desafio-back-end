Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessoes#new'
  get    'login'   => 'sessoes#new'
  post   'login'   => 'sessoes#create'
  get 'logout'  => 'sessoes#destroy'

  resources :usuarios, :transacoes
  post   'importar'   => 'transacoes#importar'
  get 	 'mostrar_transacoes', to: 'transacoes#mostrar_transacoes'
end
