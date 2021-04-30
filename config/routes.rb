Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'static_pages#home'
  
  get '/home',to: 'static_pages#home'
  get '/about',to: 'static_pages#about'
  get '/contact',to: 'static_pages#contact'

  resources :users
  get '/signup', to: 'users#new'

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :microposts, only:[:create, :destroy]

  resources :relationships, only: [:create, :destroy]

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts do
    member do
      get :like, :dislike
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
