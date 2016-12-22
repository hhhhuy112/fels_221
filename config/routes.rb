Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :categories do
      resource :download, only: [:show]
    end
    resources :questions
  end

  resources :users
  resources :categories, only: :index do
    resources :lessons, only: [:index, :show, :new, :create]
  end
  resources :searches, only: :index
  resources :search_suggestions
  resources :relationships, only: [:create, :destroy, :index]
end
