# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'users/new'
  root 'home#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
