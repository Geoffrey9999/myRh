Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/connection'
  get 'welcome/register'
  root 'welcome#index'
end