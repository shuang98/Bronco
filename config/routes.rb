Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/usersearch' => 'users#search'
  get '/home' => 'pages#home'

  resources :users do
    collection do
      post ':id/follow' => 'users#follow', as: :follow
      post ':id/unfollow' => 'users#unfollow', as: :unfollow
    end
  end
  resources :courses do
    collection do 
      get ':id/preview' => 'courses#preview', as: :preview
    end
  	resources :sections, only: [:create, :update, :destroy] do
      collection do
        get 'buildbody'
        delete 'destroybody'
      end
    end
  end
end

