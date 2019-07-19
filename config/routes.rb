Rails.application.routes.draw do
  root to: 'sessions#new'
  get    'login',   to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users
  resources :events do
    member do
      post :attending
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
