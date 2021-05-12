Rails.application.routes.draw do
  get 'auth/google_oauth2/callback', to: 'sessions#auth'
  get 'auth/failure', to: redirect('/')
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#show'
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :trips
  resources :locations
  resources :comments
  resources :users, only: [:show] do 
    resources :trips, only: [:index, :show, :new, :create, :edit, :update]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
