Rails.application.routes.draw do
  resources :companies
  get 'static_pages/about'
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  #root :to => "games#index"

  get 'search_pages/search'
  post 'search_pages/search'
  get '/register', to: 'gamers#new'
  get "/signup", to: 'gamers#new'
  get '/login', to: 'sessions#new'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :gamers, except: [:new]

  resources :games
  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
