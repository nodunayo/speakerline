Rails.application.routes.draw do
  root 'speakers#index'

  resources :speakers
  resources :proposals, only: :show
end
