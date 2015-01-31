Rails.application.routes.draw do
  
  resources :talks do
    resources :comments, only: [:create, :destroy]
  end

  root "talks#index"

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  delete '/log_out', to: 'sessions#destroy', as: 'logout'

end
