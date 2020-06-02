Rails.application.routes.draw do
  devise_for :users
  root "diaries#index"
  namespace :diaries do
    resources :searches, only: :index
  end
  resources :diaries do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update] # マイページを作成するためのルーティング
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :genres, only: [:show, :edit, :create]
end
