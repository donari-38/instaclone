# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  root 'static_pages#home'
  # root 'posts#show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    conformations: 'users/conformations'
  }

  resources :users, only: %i[index show]
  resources :posts, only: %i[index show create] do
    resources :comments, only: %i[create]
  end
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'sign_up', to: 'users/registrations#new'
    get 'my_page', to: 'users/registrations#my_page'
  end
end
