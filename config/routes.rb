Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'vacations#index'

  #resources :vacations
  #resources :legs, only: [:show, :index] do
  #  resources :itinerary_items, only: [:show, :index]
  #end

  resources :vacations

  resources :legs, only: [:index, :show, :create, :edit, :destroy] do
    resources :itinerary_items, only: [:show, :index, :new, :create, :edit]
  end

  get '/legs/new/:id', to: 'legs#new', :as => 'new_leg'

  resources :itinerary_items

  get 'places/:place_id/attractions/over20', to: 'attractions#under20', :as => :under20
  get 'places/mine', to: 'places#my_places', :as => :user_places

  resources :places do
    resources :attractions, only: [:show, :index, :new, :create, :edit]
  end

  resources :attractions

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#logout'

  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

end
