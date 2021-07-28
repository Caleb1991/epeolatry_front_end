Rails.application.routes.draw do
  root 'welcome#index'
  # resources :reader, only: [:new, :create]
end
