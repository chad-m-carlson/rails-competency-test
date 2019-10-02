Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :articles
  resources :categories, only: [:show]
  get 'editors_control_panel', to: 'pages#editors'

end
