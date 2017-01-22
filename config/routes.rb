Rails.application.routes.draw do

  resources :questions

  get 'companies/show_company'
  get 'companies/display'
  resources :companies

  get 'instances/get_instances'
  get 'instances/display'
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

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  root 'welcome#index'
end