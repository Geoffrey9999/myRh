Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/connection'
  get 'welcome/register'

  post "/welcome/create" => "welcome#create", :as => :welc

  root 'welcome#index'
end