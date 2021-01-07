Rails.application.routes.draw do
  root 'home#index'

  resources :cnab_importations, only: [:index, :new, :create]

  get 'cnab_importations/:id/import_summary', as: :import_summary, to: 'cnab_importations#import_summary'



  resources :stores, only: [:index] do
    resources :transactions, only: [:index]
  end
  
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post], as: :delayed_job
  
end
