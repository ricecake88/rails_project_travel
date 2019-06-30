Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'vacations#index'
  resources :vacations, only: [:index, :show] do 
    resources :legs, only: [:index, :show]
  end

  resources :vacations, only: [:create, :update, :destroy]
end
