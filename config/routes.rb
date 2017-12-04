Rails.application.routes.draw do
  resources :users
  get '/signup', to: 'users#new' # you signup at website/signup
  root to: 'users#show'

  resources :sessions, only: [:create]
  get '/signin', to: 'sessions#new' # you signin at website/signin
  post '/logout', to: 'sessions#logout'

  resources :posts do
    resources :comments
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
