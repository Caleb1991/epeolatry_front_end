Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessions', to: 'sessions#destroy'

  namespace :user do
    resources :dashboard, only: [:show]
    resources :words, only: [:index, :show]
    resources :books, only: [:index, :show, :create, :destroy] do
      get '/word/:word', to: 'books/word#show'
    end
  end
end
