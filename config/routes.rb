Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :cards, only: [:create, :show, :update, :destroy]

  # match ':id', constraints: { id: /[A-Z]\d{10}/ }, via: :get
end
