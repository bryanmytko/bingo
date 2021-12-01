Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :cards, only: [:create, :show, :update, :destroy]

  get '/*path' => "cards#show", constraints: -> (req) { req.fullpath =~ /\/[a-zA-Z0-9]{10}/ }
end
