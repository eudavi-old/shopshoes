Rails.application.routes.draw do
  resources :telefones

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :clientes
  resources :funcionarios
  resources :agencias
  resources :bancos
  resources :setores
  resources :cargos
  
  resources :carts, :except => [:destroy]
  get "/carrinho", to: "carts#show_cart", as: 'show_cart'
  delete "/destroy_cart", to: "carts#destroy_cart"
  delete "/delete_cart", to: "carts#delete_cart"
  put "/update_cart", to: "carts#update_cart"

  get "/product/new", to: "products#new", as: 'new_product'
  post "/product/", to: "products#create", as: 'create_product'
  get "/product/:slug", to: "products#show", as: 'show_product'
  get "/product/:id/edit", to: "products#edit", as: 'edit_product'
  put "/product/:id/update", to: "products#update", as: 'update_product'
  patch "/product/:id/update", to: "products#update"

  get '/confirmar_carrinho', to: "items#create", as: 'create_order'
  get "/pedidos", to: "orders#index", as: 'orders'

  
  get "/:page" => "pages#show"
  root "pages#show", page: "home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
