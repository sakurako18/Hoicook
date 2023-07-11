Rails.application.routes.draw do

    root :to => "user/homes#top"
    get "search" => "searches#search"

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#new_guest'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :recipes, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :tags, only: [:index, :create, :destroy]
    resources :members, only: [:index, :edit, :show, :update,]
  end

  scope module: :user do
    get "/" => "homes#top"
    get "/user_index" => "recipes#user_index"
    get "/favorite_recipes" => "favorites#favorite_recipes"

    resources :recommends, only: [:index, :new, :create, :show, :edit, :update]
    resources :members, only: [:show, :edit, :update]
    resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :tags, only: [:index, :create, :destroy, :edit]
      resources :comments, only: [:create, :destroy]
    end
  end



  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

