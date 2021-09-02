Rails.application.routes.draw do
  resources :cocktails

  devise_for :users
  
  get '/search' => 'pages#search', :as => 'search_page'
  get '/search_results' => 'pages#search_results', :as => 'search_results_page'

  root to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
