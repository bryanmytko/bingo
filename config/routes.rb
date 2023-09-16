Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :cards
  resources :games, only: [:create]

  get '/print/*path' => "cards#print", constraints: -> (req) { req.fullpath =~ /\/[a-zA-Z0-9]{10}/ }
  get '/*path' => "cards#show", constraints: -> (req) { req.fullpath =~ /\/[a-zA-Z0-9]{10}/ }
end
