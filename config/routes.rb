Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/usersearch' => 'users#search'
  get '/home' => 'pages#home'

  resources :users
  resources :courses do 
    collection do 
      get ':id/preview' => 'courses#preview', as: :preview
    end
  end
end
