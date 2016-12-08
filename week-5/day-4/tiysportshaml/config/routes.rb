Rails.application.routes.draw do
  resources :teams

  root 'teams#index'

  # Show the user the signup page
  get '/signup' => 'users#new'

  # Create the user itself
  post '/users' => 'users#create'

  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
