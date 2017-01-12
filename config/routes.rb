Rails.application.routes.draw do

  post '/instance', to: 'users#instance'
  get 'users/instance'
  resources :users

  get 'welcome/index'
  get 'welcome/connection'
  get 'welcome/register'

  root 'welcome#index'
end