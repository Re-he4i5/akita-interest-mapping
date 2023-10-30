Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "publics/registrations",
    sessions: 'publics/sessions'
  }
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  scope module: :publics do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts do
      resources :comments,only: [:index,:create,:destroy]
      resources :favorites,only: [:index,:create,:destroy]
    end
  end

  namespace :admins do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts
  end

  get "search_keyword" => "public/posts#search_keyword"
  get "check_traveller" => "public/posts#check_traveller"
  
end
