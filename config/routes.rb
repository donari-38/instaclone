# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: %i[index show]

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'sign_up', to: 'users/registrations#new'
  end
end
