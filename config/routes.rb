Rails.application.routes.draw do
  root 'file_importeds#index'
  resources :file_importeds, only: %i[index new create destroy]
end
