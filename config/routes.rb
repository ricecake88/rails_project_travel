Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'vacations#index'

  #resources :vacations
  #resources :legs, only: [:show, :index] do
  #  resources :itinerary_items, only: [:show, :index]
  #end

  resources :vacations

  resources :legs do
    resources :itinerary_items, only: [:show, :index, :new, :create, :edit]
  end

  resources :itinerary_items

  get 'places/:place_id/attractions/over20', to: 'attractions#under20', :as => :under20

  resources :places do
    resources :attractions, only: [:show, :index, :new, :create, :edit]
  end
  
  resources :attractions
  
  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#logout'

end
