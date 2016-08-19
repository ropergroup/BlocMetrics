Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :registered_applications
  end

  resources :registered_applications do
    resources :events
  end

  namespace :api, defaults: {format: json} do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  get 'about' => 'welcome#about'

  root 'users#show'

end
