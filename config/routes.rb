Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
    resources :registered_applications
  end

  get 'about' => 'welcome#about'

  root 'users#show'

end
