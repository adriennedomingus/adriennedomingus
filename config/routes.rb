Rails.application.routes.draw do
  root to: 'dashboard#show'
  resources :blogs
  resources :comments

  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"
end
