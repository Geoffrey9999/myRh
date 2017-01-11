Rails.application.routes.draw do
  resources :users

  get 'welcome/index'
  get 'welcome/connection'
  get 'welcome/register'

  root 'welcome#index'
end