Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'speakers#index'

  resources :speakers
  resources :proposals, only: [:new, :create, :show, :edit, :update]
  resources :submissions, only: [:new, :create]
  resources :events, only: [:new, :create]
end
