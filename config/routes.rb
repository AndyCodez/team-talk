Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"
  resources :projects, except: :index
  resources :comments, only: [:create]
  devise_for :users
end
