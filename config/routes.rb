Rails.application.routes.draw do
  devise_for :utilisateurs
  resources :articles
  devise_for :administrateurs
  resources :etablissements
  resources :countries
  resources :accueil
  resources :categories
  root "accueil#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
