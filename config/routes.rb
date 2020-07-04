Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  # post "/diaries/guest_sign_in", to: "diary#new_guest"
  devise_scope :user do
    post "user/guest_sign_in", to: "users/sessions#new_guest"
  end
  
  root "diaries#index" 
  namespace :diaries do
    resources :searches, only: :index
  end
  
  resources :diaries do
    resources :comments, only: [:create]
  end
  
  
  
  # resources :genres do
  #   resources :diaries do
  #     resources :comments, only: [:create]
  #   end
  # end
    
  resources :users, only: [:show, :edit, :update] # マイページを作成するためのルーティング
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :relationships, only: [:create, :destroy]
  # resources :articles

  resources :tasks
  
end
