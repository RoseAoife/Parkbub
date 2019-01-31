Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'posts/search' => 'posts#search'
  get 'posts/book' => 'posts#book'
  resources :posts
  devise_for :users
end
