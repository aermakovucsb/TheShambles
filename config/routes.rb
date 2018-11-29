Rails.application.routes.draw do
  resources :backgrounds
  resources :cards
  resources :emotes
  get 'static_pages/about'
  root "pages#home"
  get 'pages/home', to: 'pages#home'
  #root :to => "games#index"

  resources :games do
    resources :comments, only: [:create]
    member do 
      post 'like'
    end
  end

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
  resources :companies
  mount ActionCable.server => '/cable'
  get '/chat', to: 'chatrooms#show'
  resources :messages, only: [:create]

  get '/games/stats/:id', to: 'games#stats'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
