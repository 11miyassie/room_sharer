Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'
  devise_for :users
  root to: "posts#index"

  resources :users
  resources :posts
  resources :rooms do
    resources :messages
  end
end
