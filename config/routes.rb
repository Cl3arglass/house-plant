Rails.application.routes.draw do

  
  resources :users, :only => [:new, :create, :edit, :update, :show]
  
  

  root to: "static#welcome"

  get 'signin' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  post '/rides/new' => "rides#new" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
