Rails.application.routes.draw do
  resources :cocktails

  devise_for :users
  
  get '/search' => 'pages#search', :as => 'search_page'

  root to: 'cocktails#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
