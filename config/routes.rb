Rails.application.routes.draw do
  resources :recrutamentos
  resources :cnhs
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "recrutar/dashboard#index"
  ActiveAdmin.routes(self)
  resources :talentos do
    member do
      get :confirm_email
    end
  end
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
end
