Rails.application.routes.draw do
  resources :cocktails

  devise_for :users
  
  get '/search' => 'pages#search', :as => 'search_page'
  get '/search/show' => 'pages#show', :as => 'search_show_path'

  root to: 'pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
