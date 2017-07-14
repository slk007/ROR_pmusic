Rails.application.routes.draw do

  devise_for :users

  root 'index#show'

  resources :songs

end