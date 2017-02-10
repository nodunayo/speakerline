Rails.application.routes.draw do
  root 'speakers#index'

  resources :speakers
  resources :proposals, only: [:new, :create, :show]
  resources :submissions, only: [:new, :create]
end
