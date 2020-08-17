require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
