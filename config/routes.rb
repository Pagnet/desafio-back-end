require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  authenticate :user do
    resources :stores, except: %i[show new create]

    resources :financial_entries, only: :destroy do
      collection do
        get :import, action: :import_form
        post :import, action: :import
      end
    end
  end
end
