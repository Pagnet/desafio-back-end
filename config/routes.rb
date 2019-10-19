Rails.application.routes.draw do
  get 'dashboard/list_files'
  get 'dashboard/view_files'
  get 'importer/files'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
