Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#homepage'

  resources :speakers
  resources :proposals, only: [:new, :create, :show, :edit, :update]
  resources :submissions, only: [:new, :create]
  resources :events
end
