Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  resources :articles
  resources :categories, only: [:show]
  get 'editors_control_panel', to: 'pages#editors'
  get 'admin_control_panel', to: 'pages#administrator'

end
