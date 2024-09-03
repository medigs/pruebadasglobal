Rails.application.routes.draw do
  root to: "home#index"

  get 'carga_json/new', to: 'carga_json#new', as: 'new_carga_json'
  post 'carga_json', to: 'carga_json#create', as: 'carga_json'

  get 'empresas', to: 'empresas#index', as: 'empresas'
  get 'sucursales/:empresa_id', to: 'sucursales#index', as: 'sucursales'
  get 'colaboradores/:sucursal_id', to: 'colaboradores#index', as: 'colaboradores'

  get 'colaboradores/:id/editar', to: 'colaboradores#edit', as: 'editar_colaborador'
 
end


