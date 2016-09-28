Rails.application.routes.draw do
  resources :clientes
  resources :produtos
  resources :produtos
  get 'paginas/index'
  get 'paginas/produtos'
  get 'paginas/localizacao'
  root :to => 'paginas#index'
end
