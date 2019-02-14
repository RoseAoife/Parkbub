Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'parking_spaces/search' => 'parking_spaces#search'
  get 'parking_spaces/book' => 'parking_spaces#book'
  
  resources :parking_spaces
  resources :charges
  devise_for :users
end
