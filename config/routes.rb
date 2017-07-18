Rails.application.routes.draw do

  devise_for :users

  root 'index#show'

  resources :songs do 
  	member do
  		get :download

  	end
  	collection do
  		get :play
  	end
  end

end