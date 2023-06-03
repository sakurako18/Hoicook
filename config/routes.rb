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
    resources :recipes, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :members, only: [:index, :show, :edit, :update]
  end

  namespace :user do
    get "/" => "homes#top"
    get "/about" => "homes#about"
    get "/user_index" => "recipes#user_index"

    resources :recommends, only: [:index, :new, :create, :show, :edit, :update]
    resources :members, only: [:show, :edit, :update]
    resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy, :index]
      resources :tags, only: [:index, :create, :destroy, :edit]
    end
      resources :comments, only: [:create, :destroy]
    end


    # get "/users/unsubscribe" => "users#unsubscribe"  #ユーザーの退会確認画面
    # patch "/users/withdraw" => "users#withdraw"        #ユーザーの退会処理



  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

