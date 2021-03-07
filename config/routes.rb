Rails.application.routes.draw do
  root to: 'home#index'
  post 'upload', controller: 'home', action: 'upload'
end
