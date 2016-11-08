Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', :registrations => "users/registrations" }
  resources :drivers, :users

  get '/edit' => 'drivers#editall'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  root 'dashboard#show'

end
