Rails.application.routes.draw do

  root "high_voltage/pages#show", id: 'home'

  # Normal App routes
  resources :users do
    resources :skills
    resources :jobs
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
