Rails.application.routes.draw do
  resources :tweets, except: [:index]

  get "home", to: "tweets#index"

  resources :users, except: [:index, :new]

  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # post 'vote', to: 'votes#create'
  # delete 'unvote', to: 'votes#destroy'
  resources :votes, only: [:create, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
