Rails.application.routes.draw do
  resources :clientes
  resources :emails
  resources :funcionarios
  resources :dado_bancarios
  resources :agencia
  resources :bancos
  resources :setors
  resources :cargos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
