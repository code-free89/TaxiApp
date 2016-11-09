Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: "users/registrations" }

  resources :drivers
  resource :profile

  get '/edit' => 'drivers#editall'

  root 'dashboard#show'

end
