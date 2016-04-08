Rails.application.routes.draw do
  root to: 'dashboard#show'
  namespace :user do
    resources :blogs, only: [:new, :create, :edit, :update]
  end
  resources :blogs, only: [:show, :index]
  resources :comments

  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"
end
