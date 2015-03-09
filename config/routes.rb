Rails.application.routes.draw do
  root 'cabnets#index'
  resources :cabnets

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'
  get 'sign-in', to: 'auth#new'
  post 'sign-in', to: 'auth#create'
  get 'sign-out', to: 'auth#destroy'
end
