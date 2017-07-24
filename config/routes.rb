Rails.application.routes.draw do

  devise_for :users

  root 'welcome#home'

  resources :songs do 
  	member do
  		get :download

  	end
  	collection do
  		get :play
  	end
  end

  resources :moods

end