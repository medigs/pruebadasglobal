Rails.application.routes.draw do
  root to: "home#index"

  get 'carga_json/new', to: 'carga_json#new', as: 'new_carga_json'
  post 'carga_json', to: 'carga_json#create', as: 'carga_json'

end
