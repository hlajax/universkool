Rails.application.routes.draw do
  resources :dashboard
  resources :messages
  resources :demandes
  resources :diplomes
  devise_for :utilisateurs
  resources :articles
  devise_for :administrateurs
	  devise_scope :administrateur do
    get '/administrateurs/sign_out' => 'devise/sessions#destroy'
  end
  resources :etablissements
  resources :countries
  resources :accueil
  resources :categories
  root "accueil#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
