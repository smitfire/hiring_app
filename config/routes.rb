Rails.application.routes.draw do

  root "high_voltage/pages#show", id: 'home'

  get  "/register", to: "registrations#new"
  post "/register", to: "registrations#create"

  post  "/login", to: "login#create"
  delete  "/logout", to: "login#destroy"

  # Normal App routes
  resources :jobs
  resources :users do
    resources :skills
  end

  resources :companies do
    resources :admins
  end

  # API Routes
  namespace :api do
    resources :users, only: [:index, :show]
    resources :jobs, only: [:index, :show]
    resources :companies, only: [:index, :show]
  end
end
