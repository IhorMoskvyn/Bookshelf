# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: %i[new create]
end
