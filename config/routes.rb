Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'create_event', to: 'events#new'
  post 'create_event', to: 'events#create'
  get '/events', to: 'events#index'
  get 'show_event', to: 'events#show'
	resources :users
  resources :events, only [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
