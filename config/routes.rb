Rails.application.routes.draw do
  post '/' => 'home#index', as: :file_upload

  root to: 'home#index'
end