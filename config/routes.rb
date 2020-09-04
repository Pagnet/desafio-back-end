Rails.application.routes.draw do
  namespace :platform do
    resources :importers, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
