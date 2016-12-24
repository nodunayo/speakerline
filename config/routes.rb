Rails.application.routes.draw do
  root 'speakers#index'

  resources :speakers
end
