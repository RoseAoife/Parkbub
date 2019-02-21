Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'parking_spaces/search' => 'parking_spaces#search'
  get 'parking_spaces/book' => 'parking_spaces#book'

  # We'll nest bookings under parking spaces since they reference them
  resources :parking_spaces do
    resources :bookings
  end


  resources :charges

  devise_for :users
end
