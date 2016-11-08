Rails.application.routes.draw do

  resources :drivers, :customers, :users, :sessions

  # get 'users/login' => users#login
  # get 'logout' => 'users#logout'

  # Routes for login / logout
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'

  get '/edit' => 'drivers#editall'

  root 'dashboard#show'

end
