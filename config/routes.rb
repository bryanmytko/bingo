# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  root to: "pages#home"
  devise_for :users

  resources :cards
  resources :games, only: %i[create destroy update]
  resources :game_connections, only: %i[create]

  get '/print/*path' => "cards#print", constraints: ->(req) { req.fullpath =~ %r/\/[a-zA-Z0-9]{10}/ }
  get '/*path' => "cards#show", constraints: ->(req) { req.fullpath =~ %r/\/[a-zA-Z0-9]{10}/ }
end
