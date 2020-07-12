Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # post "/diaries/guest_sign_in", to: "diary#new_guest"
  devise_scope :user do
    root "users/sessions#new"
    post "user/guest_sign_in", to: "users/sessions#new_guest"
  end
  
  # root "top#index" 
  # root to: "sessions#new"
  namespace :diaries do
    resources :searches, only: :index
  end
  
  resources :diaries do
    resources :comments, only: [:create]
  end

    
  resources :users, only: [:show, :edit, :update] # マイページを作成するためのルーティング
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]

  resources :tasks
  # ハッシュタグのルールティング
  get "/diaries/genre/:name" => "diaries#genre"
  get "/diaries/genre" => "diaries#genre"
  
end
