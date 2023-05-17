Rails.application.routes.draw do

    root :to => "user/homes#top"
    get "search" => "searches#search"

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :recipes, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :members, only: [:index, :show, :edit, :update]
  end

  namespace :user do
    get "/" => "homes#top"
    get "/about" => "homes#about"
    get "/user_index" => "recipes#user_index"

    resources :recipes, only: [:index, :new, :create, :show, :edit, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    resources :members, only: [:show, :edit, :update]
    get "/users/unsubscribe" => "users#unsubscribe"  #ユーザーの退会確認画面
    patch "/users/withdraw" => "users#withdraw"        #ユーザーの退会処理

    resources :recommends, only: [:index, :new, :create, :show, :edit, :update]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
