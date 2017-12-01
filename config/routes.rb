Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :promocions
  resources :llamadas
  resources :categorias
  resources :negocios
  resources :vendedors
  resources :venta
  resources :entrevistas
  resources :version_negocios

  root 'inicio#opciones'

  get 'inicio/opciones'

  get 'users/index'

  post 'users/new'

  post 'users/create'

  get 'rechazados/users'

  get 'rechazados/negocios'

  get 'rechazados/promociones'

  get 'pendientes/rechazados'

  get 'pendientes/index'

  get 'entrevistas/index'

  get 'entrevistas/new'

  get 'version_negocios/index'

  get 'version_negocios/destroy'


end
