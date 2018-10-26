Rails.application.routes.draw do
  resources :telefones
  get 'telefone/telefone'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :clientes
  resources :funcionarios
  resources :agencias
  resources :bancos
  resources :setores
  resources :cargos
  
  resources :carts, :except => [:destroy]
  get "/show_carts", to: "carts#show_cart"
  delete "/destroy_cart", to: "carts#destroy_cart"
  delete "/delete_cart", to: "carts#delete_cart"
  put "/update_cart", to: "carts#update_cart"
  
  get "/:page" => "pages#show"
  root "pages#show", page: "home" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
