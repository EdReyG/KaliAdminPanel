Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :promocions
  resources :llamadas
  resources :categorias
  resources :negocios

  root 'inicio#opciones'

  get 'inicio/opciones'

  get 'users/index'

  post 'users/new'

  post 'users/create'

end
