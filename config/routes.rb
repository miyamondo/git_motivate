Rails.application.routes.draw do
  devise_for :users
  root to: "diaries#index"
  resources :diaries do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show] # マイページを作成するためのルーティング
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
