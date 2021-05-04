Rails.application.routes.draw do
  resources :static, :users, :sessions, :trips, :locations, :comments
  resources :users, only: [:show] do 
    resources :trips, only: [:index, :show, :new, :create, :edit, :update]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
