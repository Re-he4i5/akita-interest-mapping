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
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    get 'users/:id/withdraw' => 'users#withdraw', as: 'user_withdraw'
  end

  namespace :admins do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
  end
  
end
