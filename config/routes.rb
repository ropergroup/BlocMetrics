Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :registered_applications

  get 'welcome/index'

  get 'welcome/about'


  root 'users#show'


  resources :users, only: [:show] do
    resources :registered_applications
end
