Rails.application.routes.draw do

  get 'instances/get_instances'
  resources :instances

  resources :admins
  get 'sessions/new'
  get 'sessions/destroy'

  # get '/instance', to: 'users#instance'
  get 'users/instance'
  resources :users

  get 'welcome/index'
  get 'welcome/connection'
  get 'welcome/register'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users


  root 'welcome#index'
end