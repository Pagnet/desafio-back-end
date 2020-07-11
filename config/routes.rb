Rails.application.routes.draw do
  root to: 'home#index'
  post '/file_upload' => 'home#file_upload', as: :file_upload
end