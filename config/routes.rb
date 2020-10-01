Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :arquivo_cnabs, only:[:new, :create, :index]
end
