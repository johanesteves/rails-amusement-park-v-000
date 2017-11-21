Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:destroy]
  resources :attractions
  resources :rides, only: [:create]



  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

end