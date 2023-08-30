Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {
  #   registrations: "publics/registrations",
  #   sessions: 'publics/sessions'
  # }
  devise_for :admins
  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions'
  # }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
