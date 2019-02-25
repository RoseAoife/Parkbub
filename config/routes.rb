Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'parking_spaces/search' => 'parking_spaces#search'
  get 'parking_spaces/bookings' => 'parking_spaces#bookings'

  resources :parking_spaces do
    resources :bookings
  end
    
  resources :charges

  devise_for :users
end
