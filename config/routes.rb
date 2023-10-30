Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
  }
  
end
