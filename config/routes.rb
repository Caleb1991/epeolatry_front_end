Rails.application.routes.draw do
  root 'welcome#index'
  # resources :reader, only: [:new, :create]
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/dashboard', to: 'user/dashboard#show'

end
