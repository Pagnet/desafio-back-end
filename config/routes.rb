Rails.application.routes.draw do
  root to: 'home#index'
  post '/results' => 'home#file_upload', as: :results
end