Rails.application.routes.draw do
  root to: 'dashboard#show'

  namespace :user do
    resources :blogs, only: [:new, :create, :edit, :update], param: :slug
    resources :projects, only: [:new, :create, :edit, :update]
  end
  resources :blogs, only: [:index, :show], param: :slug
  resources :comments, only: [:new, :create]
  resources :projects, only: [:show, :index], param: :slug

  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
