Rails.application.routes.draw do
  
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/show'

  root to: "static#welcome"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
