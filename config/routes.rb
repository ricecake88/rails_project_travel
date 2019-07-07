Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'vacations#index'

  resources :vacations

  devise_for :users, :controllers => { 
    omniauth_callbacks: 'users/omniauth_callbacks',
  }


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#logout'

end
