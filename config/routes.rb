Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :clientes
  resources :emails
  resources :funcionarios
  resources :dado_bancarios
  resources :agencia
  resources :bancos
  resources :setors
  resources :cargos

   root to: "funcionarios#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
