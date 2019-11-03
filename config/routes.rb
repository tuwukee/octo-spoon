# frozen_string_literal: true

Rails.application.routes.draw do
  get "home/index"
  root "home#index"

  namespace :v1, constraints: { format: :json } do
    resources :entries, only: [:index]
  end
end
