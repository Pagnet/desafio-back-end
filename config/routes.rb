Rails.application.routes.draw do
  root "home#index"

  get "transaction/results", to: "transaction#results"
  post "transaction/", to: "transaction#create"
end
