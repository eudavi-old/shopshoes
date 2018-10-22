Rails.application.routes.draw do
  resources :telefones
  get 'telefone/telefone'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :clientes
  resources :funcionarios
  resources :agencias
  resources :bancos
  resources :setores, :as => :setor
  resources :cargos
  
  get "/:page" => "pages#show"
  root "pages#show", page: "home" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
