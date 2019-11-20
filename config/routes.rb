Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'vacations#index'
  #resources :vacations
  #resources :legs, only: [:show, :index] do
  #  resources :itinerary_items, only: [:show, :index]
  #end

  resources :vacations

  resources :legs do
    resources :itinerary_items, only: [:show, :index, :new, :create, :edit]
  end

  resources :itinerary_items

  get 'destinations/:place_id/attractions/over20', to: 'attractions#under20', :as => :under20
  get 'destinations/mine', to: 'destinations#my_destinations', :as => :user_destinations

  resources :destinations do
    resources :attractions, only: [:show, :index, :new, :create, :edit]
  end

  resources :attractions

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#logout'

  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  resources :users

  authenticated :user do 
    root 'vacations#index', as: :authenticated_root
  end

  root 'destinations#index'
end
