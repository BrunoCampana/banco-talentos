Rails.application.routes.draw do
  resources :cnhs
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :talentos
  resources :quartels
  resources :idiomas
  resources :habilidades
  resources :formmilitars
  resources :formacaoacads
  resources :cursos
  resources :cidades
  resources :certificacaos
  resources :cargoocupados
  resources :areaatuacaos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "admin/dashboard#index"
end
