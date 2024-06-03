Rails.application.routes.draw do
  passwordless_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#homepage'

  resources :speakers
  resources :proposals
  resources :submissions
  resources :events,          only: [:index, :show]
  resources :event_instances, only: [:new, :create, :show]
  resources :tags, only: [:index, :show]
  resources :users, only: [:new, :create]
end
