Rails.application.routes.draw do
  resources :users
  resources :resipses #only: [:show, :edit, :update, :destroy]
  resources :cuisines, only: [:index, :show]
  


  get '/recipes', to: 'resipses#index'
  post "/resipses/:id/edit", to: 'resipses#update'
  get '/recipes/:id', to: 'resipses#show'


  root 'cuisines#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  get 'users/edit'
end
