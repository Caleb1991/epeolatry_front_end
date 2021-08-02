Rails.application.routes.draw do
  root 'welcome#index'
  # resources :reader, only: [:new, :create]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy'
  namespace :users do
    resources :dashboard, only: [:show]
    resources :books
    resources :words
    get '/words/:word', to: 'words#show'
  end
end
