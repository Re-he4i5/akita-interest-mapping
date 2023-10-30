Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "publics/registrations",
    sessions: 'publics/sessions'
  }
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  
end
