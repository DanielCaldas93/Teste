Rails.application.routes.draw do
  devise_for :usuarios
  resources :pedidos
  resources :clientes do
		collection do
		get :listar
     			end
  end

  resources :produtos do
    collection do
    get :listar
          end
  end





  get 'paginas/index'
  get 'paginas/produtos'
  get 'paginas/localizacao'
  root :to => 'paginas#index'
end
