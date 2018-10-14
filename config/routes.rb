Rails.application.routes.draw do
  root :to => "games#index"

  get 'search_pages/search'
  post 'search_pages/search'

  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
