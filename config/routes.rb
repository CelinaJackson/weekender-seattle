Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/sign_in', to: 'devise/sessions#new'
  post '/users/:id', to: 'devise/sessions#create'
  resources :sessions, only: [:new, :create, :destroy, :omniauth, :auth]
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
