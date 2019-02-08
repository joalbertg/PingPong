# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users
  resources :games, only: %i[index show create]
  get :leaderboard, to: 'games#leaderboard'

  mount Sidekiq::Web => '/jobs'
end
