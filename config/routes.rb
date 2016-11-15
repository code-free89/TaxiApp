Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: "users/registrations" }

  resource :profile
  resources :profiles, :addresses
  resources :jobs do
    member do
      put 'set_status'
      get 'set_status'
    end
  end

  get '/driver_page' => 'profiles#driver_page'
  get '/readme' => 'dashboard#readme'

  root 'dashboard#show'

end
