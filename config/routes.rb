Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#homepage'

  resources :speakers
  resources :proposals
  resources :submissions
  resources :events,          only: [:index, :show]
  resources :event_instances, only: [:new, :create, :show]
  resources :tags, only: [:show]

  get '/session/callback', to: 'session#callback'
  get '/session/terminate', to: 'session#terminate', as: 'sign_out'
end
