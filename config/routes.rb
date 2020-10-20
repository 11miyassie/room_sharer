Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :users
  resources :posts
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
