Rails.application.routes.draw do
  devise_for :users

  mount_griddler

  require "sidekiq/web"
  mount Sidekiq::Web => "/jobs"

  get "/landing", to: "landing#show", as: :new_registration

  resources :subscriptions, only: [:create]
  resources :imports, only: [:new, :create]
  resource :settings, only: [:edit, :update]

  get "/search", to: "searches#new", as: :search
  post "/search", to: "searches#create", as: :searches

  root to: "dashboard#index", as: "dashboard"
end
