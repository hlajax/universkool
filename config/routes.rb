Rails.application.routes.draw do
  resources :etablissements
  resources :countries
  resources :accueil
  resources :categories
  root "accueil#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
