Rails.application.routes.draw do
  root to: 'dashboard#show'
  namespace :user do
    resources :blogs, only: [:new, :create, :edit, :update], param: :slug
  end
  resources :blogs, only: [:index, :show], param: :slug
  resources :comments

  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"
end
