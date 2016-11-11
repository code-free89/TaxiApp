Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: "users/registrations" }

  resource :profile
  resources :profiles, :addresses, :jobs

  get '/driver_page' => 'profiles#driver_page'

  root 'dashboard#show'

end
