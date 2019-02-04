Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'posts/search' => 'posts#search'
  get 'posts/book' => 'posts#book'
  
  resources :posts
  resources :charges
  devise_for :users
end
