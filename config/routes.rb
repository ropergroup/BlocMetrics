Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :registered_applications
  
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end