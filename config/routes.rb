Rails.application.routes.draw do
  get '/cnab', to: 'cnab#index'
  post '/cnab', to: 'cnab#upload'
  resources :customers, only: %i[index show]
end
