Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessoes#new'
  get    'login'   => 'sessoes#new'
  post   'login'   => 'sessoes#create'
  delete 'logout'  => 'sessoes#destroy'

  resources :usuarios, :transacoes
  get 'minhas_jornadas', to: 'jornadas#minhas_jornadas'
end
